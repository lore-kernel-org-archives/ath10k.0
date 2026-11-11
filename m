Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E458606A321
	for <ath10k@archiver.kernel.org>; Wed, 11 Nov 2026 03:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yjDYKU8m;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=a1xwWpyT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=; b=yjDYKU8mYWZt/ySdJ+WzsuO/sc
	xABaw1xWLPlni0y489AzN2LpR1cG6YXU5hgoOzsYErb2aiqzVexyop0r0EgoVGWHCaTMEVrshMtCH
	7mOakkY/rOWOrgZFrVqrIhtN5rsIfJkcnqJW8zMMzDTX/YeHoIkTUqiesEphkfXsV4AgBGv8bNb7l
	6LUfZgVVGA6hp6BI8qKAjrTB92oSf2ddGf6XmQZWlH1Q3dvsdfcJi5XF8kS1j/63NIGJaKNMH92p1
	od3AytMKu6B4AQ+uirfo7TZMzdY6jRjNi1t8KmXmleBv5zlZgbh00bmw427AMH5GBt9uylPe/LbeM
	EvqXy9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzG6-00000005Zfi-3dQq;
	Wed, 11 Nov 2026 03:44:26 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQzG4-00000005ZfJ-1FUU
	for ath10k@lists.infradead.org;
	Wed, 11 Nov 2026 03:44:25 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-6dd7070699eso1773552eaf.3
        for <ath10k@lists.infradead.org>; Tue, 10 Nov 2026 19:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794368663; x=1794973463; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
        b=a1xwWpyTtL+eeJWt0arlV6tIB2+upZ07s851jP9iqW8eGdMggWqkDjI68jdzjoEiBB
         DnBuJoZg2u4QUMkO+hWTMVxQnskkiQbtc6Qz19P8RCgDFW1ATP5oHHFUVDOG2PS9jeHj
         eK/OFUgKwnNz0cAhK+NaKfLWiewR8hECPmrsDyicRZzVX4h214AjBf+OshqvQlcOzHjd
         01k0BL1bsYp7oRrf6iMqn0ayt0zvPKompXmzMQs0jEo9VojjaOMdTdTsWp5RFtol4sW4
         c32/aBnR+qcLWIJFWXrLQR8ya1WmT/DFTQotWKkc7s1R82gESprTKgFFyaP4oYJjal9w
         ueAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794368663; x=1794973463;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rc+P9eOpmSqibWOjblOYo4mq9VjvGRRzJUsMEztZL+k=;
        b=JaX15YLPu89kuIfUCDS72HOGFJsaD6wVXc0P1PT8LPft2o7aWioP5SP08uGD6FS987
         dwGu67y6PaAiBMy6h9FFT1LY1qp0IROdIX7CF+hkzM3vEtZG3foA8i6o3mepP68B/d6n
         dsN4QWiSNZ2qp1CYjSYXlfr2CPpLSZ9OyfUSOzEXiwOjwDchz3684bzvehqLAF/BpwYj
         igHQ+iyUok95kURf7q8VnjPgPmLKSA7wLB+5Te5xLUZMU5j0obfe7RvKmbUej9KHKIJ6
         UhT23TaHWRzswluzJHiYtmCls669CQiMbX8DzmeHsCzNV+QfR6P3gXGT3I5vnYTWc3Qf
         rJHA==
X-Forwarded-Encrypted: i=1; AL+hErHKO/ZotRl6/fAAJ+a70mM7fIqrPL/Ce+FADRMJWYyOtHYlDfz/G07EQmY2m2necVGaJC1w2ps=@lists.infradead.org
X-Gm-Message-State: APuU4Z+mq34Di0UyLUq5rNw6yBKn2lTkwqITLhZ+f8fPB0nmirDIDLAg
	pSrFtDhg35haGF0jHbAwik6RMT0urK/SxBsNLUCP4NDP+yhnFZ7kVnli
X-Gm-Gg: AYBFou2f1a4zGCRdhvmwFa74GjI0LJlxKwqeSTThnApu+lXHPMy7iXxxiwI3Hy/vCJ6
	2zEE2MsdhJ42gplQ1vlwkVZRmMEu/QwcSk3AzmrXyN5JI1iP0LCjTc3vtjQTi39I+PKc5o8Lfce
	g9gZ13JAlW5r5TGzSaDChA6+nYRioytaSN9F1Dtyou2UWo1JoafyF6RNBxt5z6Cg0dsoANPt+/N
	akh+rRRSius9vObTxLb0Z3SVP0rp9d31a14adUaWmmfzuyFS+mAWbZ4KitP0yu/jztXAp71dF9w
	VUP67AWqho3yFBemorpuvShvMDlzdA+zjIfkrS1cc8ibvC5OI9KYKyvPw9OAeZY7qHLZRlr/XdG
	V0uhsBuPB7yjeHraovjITQePvxbg9rXPiSGWvk3/CpoKTQ2K6kDlfbsVtxxtp20995QqZ82BU2q
	t6OUetu3yo0GwK7MXKrSzsQdEAZeDQurkXSn5xgZkN4e7UKNi+xmqie9lCayoarYP3s3ZLkx0XW
	1eztZQpS3PBF0K5c3koTFm3hwO6oq1/oiAPvkGySu+qbfPBllhdNxoKQVkIksWZ0wSVgATuR/mT
	44ffESENtMxA9wohnGomJZzPUMUGC3PDRkeXU0RAbpmzd+EdPVOTSwcDnCM0inr90R4aTKHMjkw
	djLdnXf82DhgwDCxpuAVSqYGzTH6GU4Xo+dL83ir3evxdUVVHUGTPk+DhK9o7pCe6bPgt7485fe
	PGtA==
X-Received: by 2002:a05:6820:1ca4:b0:6f6:1e3a:6fc with SMTP id 006d021491bc7-7191795fda6mr882755eaf.79.1794368663202;
        Tue, 10 Nov 2026 19:44:23 -0800 (PST)
Received: from ryzen.lan ([2601:644:8000:37f::e34])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4ae23031a4dsm2487525fac.14.2026.11.10.19.44.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 19:44:22 -0800 (PST)
From: Rosen Penev <rosenp@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	ath10k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: net: wireless: qcom,ath10k: add PCI devices
Date: Tue, 10 Nov 2026 19:44:18 -0800
Message-ID: <20261111034418.194610-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261110_194424_337999_5F63D8A0 
X-CRM114-Status: UNSURE (   7.53  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

ath10k PCI devices can be described as children of their PCI host
bridge, for example to supply the MAC address and calibration data
through nvmem cells. The only compatible for that was "qcom,ath10k",
but the generic PCI device schema requires a node under a PCI bus to
carry a "pciVVVV,DDDD" or "pciclass,..." compatible, so such nodes fail
validation.

Add the PCI vendor/device IDs handled by the ath10k PCI driver, as the
ath9k and ath11k PCI bindings already do.

Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index 0cb065265df4..992926ce5c5e 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -15,6 +15,15 @@ description:
 properties:
   compatible:
     enum:
+      - pci0777,11ac  # QCA988X (Ubiquiti branded)
+      - pci168c,003c  # QCA988X
+      - pci168c,003e  # QCA6174
+      - pci168c,0040  # QCA99X0
+      - pci168c,0041  # QCA6164
+      - pci168c,0042  # QCA9377
+      - pci168c,0046  # QCA9984
+      - pci168c,0050  # QCA9887
+      - pci168c,0056  # QCA9888
       - qcom,ath10k # SDIO-based devices
       - qcom,ipq4019-wifi
       - qcom,wcn3990-wifi # SNoC-based devices
-- 
2.56.0


