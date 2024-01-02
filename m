Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8D4EC46CD2
	for <ath10k@archiver.kernel.org>; Tue,  2 Jan 2024 17:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Mime-Version:Message-Id:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VPqVL0dmRjTnHtTSRbX4H2e8aFz/9nWPxdm6mZwDmT0=; b=pyzI7XF3jx7vL6cKpRzx75h7F2
	NsnSxfEfTB88No2Zm3NsomXIVvjFzGvEkDAMV3xF30zeZnGfd7rhdCEUtz7fkunzzKU8Cf4P4PcMP
	vhAN252FYtPA+2t295Ia2eBmZJ4NkUnzW0I3brW+/hz3d+hQ8ouYqMbhH/l9j03lF2tYeXYUoRFlY
	hznK/JyifYf74i/VX6mcxhRUODVTM12vWHV4wuLyK5j6skqz2/cY143yhehtB++YTQiCo5H6qsFIv
	ph8LtQ4a1Zb9Hv88fjOvrSnr0rUOhaX6etv29bXfXqK35W/fd6g+pGZAkxvLIz7sy8F8YR+N1m5M8
	Ym4A3Ybg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKib4-008bmD-2f;
	Tue, 02 Jan 2024 17:30:34 +0000
Received: from mxe-2-563.seznam.cz ([2a02:598:64:8a00::1000:563])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKiaw-008bkJ-0j
	for ath10k@lists.infradead.org;
	Tue, 02 Jan 2024 17:30:32 +0000
Received: from email.seznam.cz
	by smtpc-mxe-54579945bb-28bjw
	(smtpc-mxe-54579945bb-28bjw [2a02:598:64:8a00::1000:563])
	id 3b43b0dfc5b702753bcd3ec7;
	Tue, 02 Jan 2024 18:30:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cz;
	s=szn20221014; t=1704216602;
	bh=VPqVL0dmRjTnHtTSRbX4H2e8aFz/9nWPxdm6mZwDmT0=;
	h=Received:From:To:Subject:Date:Message-Id:Mime-Version:X-Mailer:
	 Content-Type:Content-Transfer-Encoding;
	b=wrXjOfb4x5RK7T+P7s8YQRNkq2K3A6yELYOgF7kuKeHGVqmRRVVBY9aRaU6Xl/YxU
	 kIOGWxMkuzld15M2I/AC8eqOnnQkjr2LVTid8st7nqIyAiew9fvh+nyNpQ7iK90m2I
	 Vo+cov0QJqhJtuMi9WidCm9f014+W6phCjGGTGRaCiipIHztMyZWlc1/o5iRjO5Ct7
	 TrAl7Xo8TWmWkCqnJPttRNogbnsgZlH2ZlLPmhEQcUFZP+4F0B4IyhXXv31287DUTY
	 lT+dsd7Opp0Od4GfN8ZZjuaAKK7q25t6auXU7lKMOJr8FFWNVRdioWEB812N8l4Fi1
	 IklourK28e4kg==
Received: from 184-143.gtt-net.cz (184-143.gtt-net.cz [82.144.143.184])
	by email.seznam.cz (szn-UNKNOWN-unknown) with HTTP;
	Tue, 02 Jan 2024 18:29:59 +0100 (CET)
From: "Tomas Paukrt" <tomaspaukrt@email.cz>
To: "Kalle Valo" <kvalo@kernel.org>,
	"Jeff Johnson" <quic_jjohnson@quicinc.com>,
	<ath10k@lists.infradead.org>,
	<linux-wireless@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: ath10k: add USB device ID for Atheros QCA9377-7
Date: Tue, 02 Jan 2024 18:29:59 +0100 (CET)
Message-Id: <BBh.ZZQj.57mzV1Mb9h2.1bb4WN@seznam.cz>
Mime-Version: 1.0 (szn-mime-2.1.33)
X-Mailer: szn-UNKNOWN-unknown
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_093027_043607_78EEE0E9 
X-CRM114-Status: UNSURE (   7.65  )
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
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

Add USB device ID for modules based of Atheros QCA9377-7 chipset.

Signed-off-by: Tomas Paukrt <tomaspaukrt@email.cz>
---
 drivers/net/wireless/ath/ath10k/usb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/net/wireless/ath/ath10k/usb.c b/drivers/net/wireless/=
ath/ath10k/usb.c
index 3c482ba..5d5cc0c 100644
--- a/drivers/net/wireless/ath/ath10k/usb.c
+++ b/drivers/net/wireless/ath/ath10k/usb.c
@@ -1106,6 +1106,7 @@ static int ath10k_usb_pm_resume(struct usb_interface=
 *interface)
 
 /* table of devices that work with this driver */
 static struct usb_device_id ath10k_usb_ids[] =3D {
+	{USB_DEVICE(0x0cf3, 0x9378)}, /* Atheros QCA9377-7 */
 	{USB_DEVICE(0x13b1, 0x0042)}, /* Linksys WUSB6100M */
 	{ /* Terminating entry */ },
 };
-- 
2.7.4


