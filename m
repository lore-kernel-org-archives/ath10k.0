Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-wm0-f65.google.com ([74.125.82.65])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cXn3U-0003Uu-2A
 for ath10k@lists.infradead.org; Sun, 29 Jan 2017 10:49:59 +0000
Received: by mail-wm0-f65.google.com with SMTP id c85so69910405wmi.1
 for <ath10k@lists.infradead.org>; Sun, 29 Jan 2017 02:49:34 -0800 (PST)
Received: from lichtkranz.fritz.box (HSI-KBW-085-216-067-125.hsi.kabelbw.de.
 [85.216.67.125])
 by smtp.gmail.com with ESMTPSA id y127sm13077859wmg.12.2017.01.29.02.48.31
 for <ath10k@lists.infradead.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Jan 2017 02:48:31 -0800 (PST)
Date: Sun, 29 Jan 2017 11:48:30 +0100
From: Tobias Predel <tobias.predel@gmail.com>
Subject: Recent driver changes destabilized QCA9377 connection quality
Message-ID: <20170129104829.GA3440@lichtkranz.fritz.box>
MIME-Version: 1.0
Content-Disposition: inline
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

I just want to report a negative development I have been experiencing for a week now.

Recent changes in ath10k driver code seem to destabilize QCA9377 connection quality in 802.11b/g networks, as hardware and software configuration (wpa_supplicant) hasn't changed. Before, I have managed to have a fair connection quality for around three months. At the moment I encounter multiple connection losses.

dmesg reports usual losses and timeouts on both linux-lts 4.4.44 and linux 4.8.13 (Arch Linux). 

Please restore former functionality.

Sincerely yours,

Tobias Predel
-- 
Tobias Predel
currently studying Transportation engineering B.Sc.
at Stuttgart University

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
