Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x22b.google.com ([2607:f8b0:400c:c08::22b])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bsGhw-0000Bc-Mn
 for ath10k@lists.infradead.org; Thu, 06 Oct 2016 22:00:05 +0000
Received: by mail-ua0-x22b.google.com with SMTP id u68so30251529uau.2
 for <ath10k@lists.infradead.org>; Thu, 06 Oct 2016 14:59:41 -0700 (PDT)
MIME-Version: 1.0
From: David Hutchison <dhutchison@bluemesh.net>
Date: Thu, 6 Oct 2016 15:59:40 -0600
Message-ID: <CA+i30h8YsG7mce5FMwGw2fRNAn3USYV6K==QMjMQVeSGB0dj=w@mail.gmail.com>
Subject: QCA9887 Firmware Memory Usage
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
To: kvalo@adurom.com, ath10k@lists.infradead.org

Hello,

I am using a Mikrotik hAP AC Lite which has a QCA9887 radio. It
appears to be working; however ath10k ( or the qca9887 firmware ) is
utilizing 15 - 20mb of memory. I applied the kfree(caldata) patch, to
insure there is no memory leak.

It doesn't appear to be leaking, and it will run Ok with the high
memory footprint. However the Mikrotik hAP AC Lite is only a 64mb
platform; so when I initialize the 2nd radio with ath9k I get OOMs.

It just doesn't seem right that when ath10k + qca9887 is in AP mode
that it's utilizing as much memory as it is. I don't think the issue
is with ath10k, I think it's the qca9887 firmware (
firmware-5.bin_10.2.4-1.0-00013 ).

Is there a newer build available that may potentially fix these memory
issues? The latest one available on
https://github.com/kvalo/ath10k-firmware/blob/master/QCA9887/hw1.0/firmware-5.bin_10.2.4-1.0-00013
is 2 months old. Perhaps there is a newer build to test that may have
the fix?

Any thoughts as to what it could be? I can provide more information if needed.

Thanks!

-- Davey

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
