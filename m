Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from omr2.cc.ipv6.vt.edu ([2607:b400:92:8400:0:33:fb76:806e]
 helo=omr2.cc.vt.edu)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCg6q-0007QY-19
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 04:37:53 +0000
Received: from mr4.cc.vt.edu (mr4.cc.ipv6.vt.edu
 [IPv6:2001:468:c80:2105:0:232:8670:19fe])
 by omr2.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5E4bOVB023421
 for <ath10k@lists.infradead.org>; Tue, 14 Jun 2016 00:37:24 -0400
Received: from mail-wm0-f69.google.com (mail-wm0-f69.google.com [74.125.82.69])
 by mr4.cc.vt.edu (8.14.4/8.14.4) with ESMTP id u5E4bJ36008788
 for <ath10k@lists.infradead.org>; Tue, 14 Jun 2016 00:37:24 -0400
Received: by mail-wm0-f69.google.com with SMTP id k184so38927715wme.3
 for <ath10k@lists.infradead.org>; Mon, 13 Jun 2016 21:37:24 -0700 (PDT)
MIME-Version: 1.0
From: Gaurang Ramesh Naik <gaurang@vt.edu>
Date: Tue, 14 Jun 2016 00:37:17 -0400
Message-ID: <CAFc9h7vk6e-BntP+GMv8s2jaNSOkA=37rChTjss2-7mgupAv7Q@mail.gmail.com>
Subject: Problem with spectral scan in VHT80 mode
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
To: ath10k@lists.infradead.org

Hello,

I was trying the ath10k's spectral scan. I used the following commands
given on the link
https://wireless.wiki.kernel.org/en/users/drivers/ath10k/spectral

echo 8 > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_count
echo manual > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
echo trigger > /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan_ctl
cat /sys/kernel/debug/ieee80211/phy0/ath10k/spectral_scan0 >> /tmp/fft.dump

I am using OpenWrt Bleeding edge. In the HT20 and HT40 mode, I
correctly get 8 samples. However, in the VHT80 mode, the /tmp/fft.dump
file generated is empty.

In the open issues on the above link, it said that the HT40 and HT20
modes ignore the count parameter. That isn't the case for me. I seem
to get correct # of samples (I view the dump file using
https://github.com/simonwunderlich/FFT_eval). However, in the VHT80
mode, there seems to be no output. Am I doing something wrong here?

Thanks,
Gaurang.

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
