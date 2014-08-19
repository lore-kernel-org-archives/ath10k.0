Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wg0-x22a.google.com ([2a00:1450:400c:c00::22a])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XJZ8w-0002Ic-QB
 for ath10k@lists.infradead.org; Tue, 19 Aug 2014 02:27:27 +0000
Received: by mail-wg0-f42.google.com with SMTP id l18so5685339wgh.1
 for <ath10k@lists.infradead.org>; Mon, 18 Aug 2014 19:27:03 -0700 (PDT)
MIME-Version: 1.0
From: Avery Pennarun <apenwarr@gmail.com>
Date: Mon, 18 Aug 2014 22:26:42 -0400
Message-ID: <CAHqTa-0GxKjo2ObRtoAKu6H9J6upC7JNS44MpNQpFDPXpiEKJw@mail.gmail.com>
Subject: Support for scan while in AP mode, and offchannel while in AP mode
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

Hi,

In the ath9k and several other drivers, commands like the following
work while in AP mode:

  iw wlan0 scan -u ap-force passive
and
  iw wlan0 offchannel 2452  100

On ath10k (using a driver from v3.15-rc1 as of April 13th), these tell
me the operation is not supported.

Are there any plans to implement this feature?  It's important in
order to implement automatic channel change in case of changes in the
interference environment.

Thanks,

Avery

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
