Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2DD9CCF9E3
	for <ath10k@archiver.kernel.org>; Mon, 10 Nov 2025 14:26:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Q/9D0Jp40snHbhJJJgLlrj1Fk/9QY7mQFBv9kKFvHE=; b=KtzQNlSZmfZUYaCzIy1qyORR5R
	5Hnfa8jQRnk1akCqABkXwdNsDgxwZfBzJELle+nZG9iIjl/+gzn07uK7Yua472VfUktJTtFaMgG4v
	N9m3MErJgwBujzp7gbFYhquKlsiS8u+b1Sh9BfzXnM/7968cFzpHffElTpydquQq21Z1F4nMtCzi6
	BgUdyxVrODsykUVHjIuJlKh1y2u5l5uBLXJgQjp54C9RWsU6lmxme83kteVMhQLA29/POrA/6+JfM
	DJuSlOPALArjuZKM3eLKT86F8NEFrUmJIxftLv/QA//5c+YnfQmB2ZFQGgMEUEVrCg4Y1xrkuJV6W
	M+esOJzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISqk-00000005a9T-1Uzw;
	Mon, 10 Nov 2025 14:26:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vISqj-00000005a8s-1BWu
	for ath10k@lists.infradead.org;
	Mon, 10 Nov 2025 14:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7D057601AE;
	Mon, 10 Nov 2025 14:26:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0468EC116D0;
	Mon, 10 Nov 2025 14:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762784788;
	bh=ol4yxR65KYgqJh69E3ODmJnCY2Jhd60J7DsO/peauHU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=FrM9LKHKnuBj+i3aUkAyAEYuBtc89JcY0jAvgHHOq9LI1u5IFFztidxtc/2DPryRc
	 0X3brVrnZFjuJ9I+8HCXR7zr/7l5lwMJ1xC+LbjJiNJQFy/ZZFyJtZ3adQAA4wqf5Y
	 ePWguUwDGJvXKIsUFtO/gploXoQ/utyqUlBQlmXta0pPQ71FYl9e3eClm+FN34u4Gw
	 vXGWkM8QpwAceaT2oz42rdppnpLoVXYg+qOKiiviyCB2AOugaBE3zhsqx5jC4Zx+wT
	 WuXka+PsgL1WkUrJubyXA5nhxnWikVePgUBHhZ+t3SlRM1uijtr/CrsO9WkRnmcfR6
	 YsDlwrBIsBQIA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED67DCCFA13;
	Mon, 10 Nov 2025 14:26:27 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Nov 2025 15:26:24 +0100
Subject: [PATCH v2 1/3] dt-bindings: wireless: ath10k: Introduce quirk to
 skip host cap QMI requests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-skip-host-cam-qmi-req-v2-1-0daf485a987a@ixit.cz>
References: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
In-Reply-To: <20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz>
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, devicetree@vger.kernel.org, 
 ath10k@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>, Amit Pundir <amit.pundir@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=eDK/4tDlTIOnXZQxvVBLLpr0TJmEnv0tcxiF4I9sY4E=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpEfYSfLM7kuds/BZ5AbbeeHF6crfp64r5Gw046
 zUV8PnwV9KJAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCaRH2EgAKCRBgAj/E00kg
 cjTfD/9EshPGakS5iAT+22AYaa3mUXdiTUXN8PKvCgc3+hZCwvKI4Zijj0/VN2vhn3ZJhmaU4Tq
 7mzRv9Z5VAP2p4+LImDkyXb5H6jGqU/0SlyqwAIA9kNqrFn03CG3sdC8pnPj0KHs+u1S+dFJdOS
 KB4hffPdH98RYUtp7vhDwAQtiFZQt2CoSGrscADWqlAGFQ3bgfOWbha4iQD/PjACPbn1MheIVLn
 CkMZG7Ve9nD9oDJbqFVwTlxQqwne/D7yk9skToP6XafkpGCIdyqCK0hMjpimhZb944MXGkJOKyN
 L7XHGtDEz0LTntEwRe7pgJjMERFmJ2YOBgKPlVcqWBp1edtUlbgF6JdKZPWQ1vUGRZOaxOtU86j
 s6DJGJZInmX273a4Lnw6LCF1TBjgwm4fvOUctg+0m0ZcRomT9tNP8w3IWafmiI+LQ7p1m7uUKlM
 VEXMHv9XpFMTnZB7LhHHdhgZhrj0XfGNowKeczunS+sIlnArvXSuVUbTDx+hL6GjHTl75I7RQaK
 5oPRJZaR2zYi/z9fqfQNemJnqrdcf/gWanc11bdy79WG6OTdBwjcZpJ1sVMg5Zq7vGy3T5uOHz4
 PdG3E8eH94Su9ICXmvy9wK5Fl5jE/QHgOUYQ7u4XXm7ZZ0OXAPt0qe79FC2DwoAtk1SJlj7ro2v
 d6E+GbkHdDCDydw==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Reply-To: david@ixit.cz
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

From: Amit Pundir <amit.pundir@linaro.org>

Introducing this quirk to skip host capability QMI request for the firmware
versions which do not support this feature.

Signed-off-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: David Heidelberg <david@ixit.cz>
---
 Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index f2440d39b7ebc..5120b3589ab57 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -171,6 +171,12 @@ properties:
       Quirk specifying that the firmware expects the 8bit version
       of the host capability QMI request
 
+  qcom,snoc-host-cap-skip-quirk:
+    type: boolean
+    description:
+      Quirk specifying that the firmware wants to skip the host
+      capability QMI request
+
   qcom,xo-cal-data:
     $ref: /schemas/types.yaml#/definitions/uint32
     description:

-- 
2.51.0



