الاستيراد مؤسسة

هيكل تخزين موافقة صفحة الويب {
    خاص فار الموافقات: [معرف المحادثة: Set<String>] = [:]

    متحور وظيفة السماح بعناوين URL(معرف المحادثة: معرف المحادثة، عناوين URL: [سلسلة]) {
        حارس !معرف المحادثة.isEmpty else { return }
        دع عناوين URL الطبيعية = تعيين (عناوين URL.compactMap(تطبيع))
        حارس !عناوين URL الطبيعية.isEmpty else { return }
        الموافقات[معرف المحادثة، default: []].formUnion(عناوين URL الطبيعية)
    }

    وظيفة مسموح بها(معرف المحادثة: معرف المحادثة، عناوين URL: [سلسلة]) -> Bool {
        حارس !معرف المحادثة.isEmpty else { return false }
        دع عناوين URL الطبيعية = تعيين (عناوين URL.compactMap(تطبيع))
        حارس !عناوين URL الطبيعية.isEmpty,
              دع عناوين URL المعتمدة = الموافقات[معرف المحادثة]
        آخر {
            يعود كاذب
        }
        يعود عناوين URL الطبيعية.isSubset(من: عناوين URL المعتمدة)
    }

    mutating func clear(conversationId: ConversationID) {
        guard !conversationId.isEmpty else { return }
        approvals.removeValue(forKey: conversationId)
    }

    private func normalize(_ url: String) -> String? {
        let normalizedURL = url.trimmingCharacters(in: .whitespacesAndNewlines)
        return normalizedURL.isEmpty ? nil : normalizedURL
    }
}
