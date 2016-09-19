Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-io0-x22d.google.com ([2607:f8b0:4001:c06::22d])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1blpoi-00025C-5G
 for ath10k@lists.infradead.org; Mon, 19 Sep 2016 04:04:28 +0000
Received: by mail-io0-x22d.google.com with SMTP id m79so80446206ioo.3
 for <ath10k@lists.infradead.org>; Sun, 18 Sep 2016 21:04:07 -0700 (PDT)
MIME-Version: 1.0
From: Nikolay Martynov <mar.kolya@gmail.com>
Date: Mon, 19 Sep 2016 00:04:06 -0400
Message-ID: <CALGY4fsT80wV8esgRzknqCt1md_AoC1Dogc4p759-mOL1NF2qA@mail.gmail.com>
Subject: QCA988X rate control question
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

Hi.

  I've got Archer C7 v2 router (QCA988X), running latest openwrt and
intel 6300 client.
  I'm observing strange behavior on how ath10k sets tx rate:

              Peer MAC address xx:xx:xx:xx:xx:xx
                     Peer RSSI 28
                  Peer TX rate 72200
                  Peer RX rate 243000
              Peer RX duration 0

  (I'm getting similar numbers in iw station dump on client side)

   It looks like intel is able to transmit at much higher rate than ath10k.
   As the consequence speed to client is slower that speed from client.

  Is this expected or is this some short of known problem? Is there
any way to debug this?

Thanks!

-- 
Martynov Nikolay.
Email: mar.kolya@gmail.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
