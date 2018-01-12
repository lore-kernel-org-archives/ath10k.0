Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-it0-x231.google.com ([2607:f8b0:4001:c0b::231])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1eZoQH-0003Kc-W5
 for ath10k@lists.infradead.org; Fri, 12 Jan 2018 01:46:23 +0000
Received: by mail-it0-x231.google.com with SMTP id b5so7268277itc.3
 for <ath10k@lists.infradead.org>; Thu, 11 Jan 2018 17:46:11 -0800 (PST)
MIME-Version: 1.0
From: Robert Jones <rjones@gateworks.com>
Date: Thu, 11 Jan 2018 17:46:09 -0800
Message-ID: <CALAE=UDvCnuTK_mFJsdPccTbb6gxHmd_aw4HmL8mdvLZ3VL_mA@mail.gmail.com>
Subject: Problems Configuring VHT160 and VHT80+80 for QCA9984
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k <ath10k@lists.infradead.org>

Hello,

I'm working with a WLE1216V5-20 ath10k wave 2 card using QCA9984
chipset and having problems configuring an AP for VHT160 or 80+80
mode. The hostapd v2.6 tool in both cases tells me that the "Driver
does not support configured VHT capability".

I'm using the custom board and firmware .bin files found at
http://www.candelatech.com/ath10k-10.4.php. I see on the same page
that they recommend using one of Ben Greear's kernels but I would
prefer to stick with a mainline 4.14 if possible.

Is this capability truly missing from the ath10k driver or am I
misconfiguring something in my hostapd.conf?

If the former, can anyone point me to a patch set that I can apply to
the ath10k driver to support either of these two modes?

Regards,
Robert Jones

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
