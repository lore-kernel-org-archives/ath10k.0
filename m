Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cXwuU-0002wX-9z
 for ath10k@lists.infradead.org; Sun, 29 Jan 2017 21:21:21 +0000
Received: by mail-wm0-f68.google.com with SMTP id r18so1598861wmd.3
 for <ath10k@lists.infradead.org>; Sun, 29 Jan 2017 13:20:57 -0800 (PST)
Received: from lichtkranz.fritz.box (HSI-KBW-085-216-067-125.hsi.kabelbw.de.
 [85.216.67.125])
 by smtp.gmail.com with ESMTPSA id c9sm15508121wmi.16.2017.01.29.13.19.55
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Jan 2017 13:19:56 -0800 (PST)
Resent-Message-ID: <20170129211954.GB3978@lichtkranz.fritz.box>
Resent-To: ath10k@lists.infradead.org
Date: Sun, 29 Jan 2017 22:18:57 +0100
From: Tobias Predel <tobias.predel@gmail.com>
Subject: Re: Recent driver changes destabilized QCA9377 connection quality
Message-ID: <20170129211857.GA3978@lichtkranz.fritz.box>
References: <20170129104829.GA3440@lichtkranz.fritz.box>
 <CAJ-VmokDYHg8UJLq7LadWFeN_B2wFj3LLVj=FifWzzvT3k8o_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAJ-VmokDYHg8UJLq7LadWFeN_B2wFj3LLVj=FifWzzvT3k8o_A@mail.gmail.com>
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
To: Adrian Chadd <adrian@freebsd.org>

Hello,

The driver recognizes my hardware as "qca9377 hw1.0 (0x05020000, 0x003820ff sub 1a3b:2231)" with firmware details "fw WLAN.TF.1.0-00267-1 fwapi 5 bdapi 2 htt-ver 3.1 wmi-op 4 htt-op 3 cal otp max-sta 32 raw 0 hwcrypto 1 features ignore-otp". Firmware file is saved as firmware-5.bin.

I did remove the board.bin file while keeping board-2.bin for testing but that didn't help either. With or without that board.bin no more error messages are thrown up but connection losses (sometimes).

Cheers,

Tobias
-- 
Tobias Predel
currently studying Transportation engineering B.Sc.
at Stuttgart University

Mails to amnelio@hotmail.com (and st108053@stud.uni-stuttgart.de) are automatically forwarded to tobias.predel@gmail.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
