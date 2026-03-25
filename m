Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1100A109C040
	for <ath10k@archiver.kernel.org>; Wed, 25 Mar 2026 17:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nSvp51Fkd2V3CXGB3Rw7WIW7i0ea9zzYjpA+Ad3JGJE=; b=R4A/gJ4NFmFYXNmkDYxZP/kiEc
	uxilPscVimKtCtsmOx/QkIsiOvk05NlQQiJNTcUmN8je8BPIB6hiLgIu0ocblc46tGSVFz3V4jy8X
	p07Y3OGX/CiEQRZ6AilZ5Cd1ai+9RYSk2mRtDH936S7vzohEkzLBI0qUaXh/Uaapm5kn9whOwJK08
	XmHMo8VWnUGnjSh/6EMHD893t4MkbIWjPKgYTbRnFn7EN6rFaOQsgHFdrYtnQx+XuDgEpLEycWyBm
	U0RcjDTg95Ozk+DpF4/TONLm0TgUITLfZuGi1OHj860xs4a67qst+qqkPZHhTwHmmd+OrgRb2Zhc2
	G08PVLnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STt-000000041cT-3Ot6;
	Wed, 25 Mar 2026 17:57:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STr-000000041bF-3XrA
	for ath10k@bombadil.infradead.org;
	Wed, 25 Mar 2026 17:57:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Sender:Content-ID:Content-Description:In-Reply-To:References;
	bh=nSvp51Fkd2V3CXGB3Rw7WIW7i0ea9zzYjpA+Ad3JGJE=; b=Gbqx0+jfHzw7xontJZ/Yw24MXI
	CZasBsIPvXAOaYSDepQnUlcK8ZheCqyWPCgr4MHlbTPGPS36DOzqFW+qptFchJKkpK5RupmjBuwSz
	qUm65kTRC3O9pFcHxo2qIq4+/zkdXxKRSZev+0eu1r3o61u8AEyhl6pXw9E6u+3HLApYrvcLbGBfq
	lX+SDJqUEtQeRfolEK5jfzxIpLhwf1thCK3K/PFSXrBNxuftr0yJEo7ydQPvGcuXoRREe4AyQdvgg
	T6hEfzLX4WaGAbaW1JP8LpeQaAvLg4obRdtdX4Bi/ZEa+A9JQkN+M9aLmA9gqnkirE7GlcXNNYc+i
	ixmswwgg==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5STo-00000006n0T-0jJn
	for ath10k@lists.infradead.org;
	Wed, 25 Mar 2026 17:57:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D32C944570;
	Wed, 25 Mar 2026 17:57:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AC6E7C2BCB1;
	Wed, 25 Mar 2026 17:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774461438;
	bh=l+Sa6PHie0+76HOU1LeHnQNEt+3sCVhiCKKJMpio3TI=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LyQqQFlStrqXuLb5r08huZTd85F+NyFKXuJxU+45+FdxMTwneGrNm5lkTSvM7ZflR
	 Vqj3xchr/HuM2tw4tQwKeVPP9RFvhKLZwE4l1knBsAL1NLNzrpTLDV/rb1azFomtI0
	 Paz8Wa2Dz7n9m179NvK7CZzW8/+MeVnUWOJqbGCO/zffxo4/skx98M0DTKCPbru3kP
	 dNz4fgdPssP5ZPUWdMV7z3PhwfGKNj385vA9kG9z7g2Az4wZyyjnNyljCbjfQDBjlM
	 hHGFBqeTnJt7rIqfHfd8GaeWc65HmzXPUQtMrRCWhZN8lkS1TSUPt/PPtH8AG7+Iwm
	 5kXL7cNn5xNPw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98A77109C040;
	Wed, 25 Mar 2026 17:57:17 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Subject: [PATCH v4 0/3] ath10k: Introduce a devicetree quirk to skip host
 cap QMI requests
Date: Wed, 25 Mar 2026 18:57:14 +0100
Message-Id: <20260325-skip-host-cam-qmi-req-v4-0-bc08538487aa@ixit.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPohxGkC/4XOTW6DMBAF4KtEXnci/2DHZJV7VFkYM8CoMSY2R
 Ukj7l6DVHVVdTPSW8z33otlTISZnQ8vlnChTHEsoXo7MD+4sUegtmQmudRCCA75gyYYYp7BuwD
 3QJDwDii0NtJi41XNyu+UsKPH7r5fS+5SDDAPCd2uCcMF11ZbAaKuTLnQ0wwZxxYwOLqBCzQfp
 8+xpXS50ehSPMbUb/RAeY7puS9e5Fbw37hFAgfeuq6y2tX25C70KLr/Ytu0Rf0Yhiup/zJUMRp
 hlO9OjfJW/Brrun4D2U6Qa0cBAAA=
X-Change-ID: 20251110-skip-host-cam-qmi-req-e155628ebc39
To: Johannes Berg <johannes@sipsolutions.net>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jeff Johnson <jjohnson@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Paul Sajna <sajattack@postmarketos.org>
Cc: Amit Pundir <amit.pundir@linaro.org>, linux-wireless@vger.kernel.org, 
 devicetree@vger.kernel.org, ath10k@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 phone-devel@vger.kernel.org, David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2045; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=l+Sa6PHie0+76HOU1LeHnQNEt+3sCVhiCKKJMpio3TI=;
 b=owEBbQKS/ZANAwAIAWACP8TTSSByAcsmYgBpxCH7ElA0Nd5DUi8t0QqcUigdI3QY//8k7Dyqz
 jRky/PwpA+JAjMEAAEIAB0WIQTXegnP7twrvVOnBHRgAj/E00kgcgUCacQh+wAKCRBgAj/E00kg
 coh6D/9AsFFPwvKeFoEmXBxHBif+w1qdamrOK/Ez4rcrIsTVlItX5wcf0yvYzIqKrSlCUphp+VT
 Z6Yhj3aT2UZvsS3qgXPwQtHqaTEAeHRgFzYq+pAgPat953/4tI4TS1ca0EsFIw0WDLU4R6THF/L
 74IB2IPQHC9kjNEDJemH9hrq9pFljUIVClfY3v/BQ4jocazqY50lMqIoKiGORKAR0+tNmGZQ14J
 z/MCGoE+aFkpa2sT0Y4ZvE3fh3i0XmKd/WPtH/hxvvXtvrEYHGzeCe+eXYkKpcAuA26837an0fw
 dvTgC+XehXWRTASnhgWZxS1IcFizrAIUub9JNw00qjZuGTrJKuQ7GJWCPlgzMX9XxL3hrbLS+t3
 st4RAVjGZ0+dDqS9Syh/3ARmo28jsHaC3StTM1NfLWmiizOz+O5BxfmRs0YHC3p+z/bVyGM9Clz
 v3+aBR58MiZojkFjYR41592dQNzxwRbRcru4lvvNY1plFKADVL7DeFPMMD/aNKfHEi4tqN6cKwV
 3DK8BW41yVsw9djWl8S0s08GLaUDKTQMTKB2SB12bQ/KguMb3yLYLfPWywonmPBdRJbqQ9IwhrV
 NOFr72aIKW0pWa5PAHFt6rdFamToZHz2vZV4Ekk9SWRiF2tr2jezhkOyFA+Kyu1Lk8YrADVRj0G
 sA0j4vvHSlRZIlA==
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_175720_794802_782793EA 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

This quirk is used so far used on:
 - LG G7 ThinQ
 - Xiaomi Poco F1

I'm resending it after ~ 4 years since initial send due to Snapdragon
845 being one of best supported platform for mobile phones running
Linux, so it would be shame to not have shiny support.

Original thread:
  https://lore.kernel.org/all/b796bfee-b753-479a-a8d6-ba1fe3ee6222@ixit.cz/

I tried the embedding the information inside the firmware, but the
information is required *before* loading the firmware itself.
Firmware quirk thread:
  https://lore.kernel.org/linux-wireless/20251111-xiaomi-beryllium-firmware-v1-0-836b9c51ad86@ixit.cz/

Until merged, available also at:
  https://codeberg.org/sdm845/linux/commits/branch/b4/skip-host-cam-qmi-req

Signed-off-by: David Heidelberg <david@ixit.cz>
---
Changes in v4:
- Added my own missing SoB. (Dmitry)
- Improve the commit message. (Dmitry)
- Link to v3: https://lore.kernel.org/r/20260325-skip-host-cam-qmi-req-v3-0-b163cf7b3c81@ixit.cz

Changes in v3:
- Rebased on recent linux-next (next-20260325).
- Improved motivation and description. (Dmitry)
- Link to v2: https://lore.kernel.org/r/20251110-skip-host-cam-qmi-req-v2-0-0daf485a987a@ixit.cz

---
Amit Pundir (3):
      dt-bindings: wireless: ath10k: Add quirk to skip host cap QMI requests
      ath10k: Add device-tree quirk to skip host cap QMI requests
      arm64: dts: qcom: sdm845-xiaomi-beryllium: Enable ath10k host-cap skip quirk

 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml       |  6 ++++++
 .../arm64/boot/dts/qcom/sdm845-xiaomi-beryllium-common.dtsi |  1 +
 drivers/net/wireless/ath/ath10k/qmi.c                       | 13 ++++++++++---
 drivers/net/wireless/ath/ath10k/snoc.c                      |  3 +++
 drivers/net/wireless/ath/ath10k/snoc.h                      |  1 +
 5 files changed, 21 insertions(+), 3 deletions(-)
---
base-commit: 85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
change-id: 20251110-skip-host-cam-qmi-req-e155628ebc39

Best regards,
-- 
David Heidelberg <david@ixit.cz>



