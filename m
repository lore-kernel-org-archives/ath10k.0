Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x244.google.com ([2607:f8b0:4001:c06::244])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1aRB7C-0004yK-S5
 for ath10k@lists.infradead.org; Thu, 04 Feb 2016 04:01:55 +0000
Received: by mail-io0-x244.google.com with SMTP id k127so3606178iok.1
 for <ath10k@lists.infradead.org>; Wed, 03 Feb 2016 20:01:34 -0800 (PST)
MIME-Version: 1.0
Date: Wed, 3 Feb 2016 20:01:33 -0800
Message-ID: <CABy9W5kEX6OvDLV84bQ6RV9Xf4cKpp1dAf4RS4Ff9UhumLMTdw@mail.gmail.com>
Subject: 80 MHz channel - Station data
From: Ann Lo <annlo.tech@gmail.com>
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

Hi,

When we set up 80MHz channel between AP and client station, we use the
iw station dump command to get the "rx bitrate" of the client station.
We have noticed that not only the MCS changes, the NSS also changes.
Is it normal to have dynamic values of NSS when we do iperf using 80
MHz channel?

Some data on "rx bitrate" of the same client station is as follows:

rx bitrate:     58.5 MBit/s VHT-MCS 1 80 MHz VHT-NSS 1
rx bitrate:     702.0 MBit/s VHT-MCS 5 80MHz VHT-NSS 3

We use kernel 3.14.28 and WLE900VX.

Thanks,
Ann

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
