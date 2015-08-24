Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from netlab.snu.ac.kr ([147.47.106.80])
 by casper.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZTl9D-0003AI-BT
 for ath10k@lists.infradead.org; Mon, 24 Aug 2015 06:22:24 +0000
Received: from theoriaPC ([147.46.66.32])
 by netlab.snu.ac.kr (8.14.3/8.14.3/SuSE Linux 0.8) with ESMTP id
 t7O6LRYh020487
 for <ath10k@lists.infradead.org>; Mon, 24 Aug 2015 15:21:29 +0900
From: "Seowoo Jang" <swjang@netlab.snu.ac.kr>
Subject: How to access the CCA related operation
Date: Mon, 24 Aug 2015 15:21:25 +0900
Message-ID: <006a01d0de35$1bde70a0$539b51e0$@netlab.snu.ac.kr>
MIME-Version: 1.0
Content-Language: ko
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

Hello, =


We are trying to evaluate our idea on 802.11ac protocol with Atheros qca9880
/ ath10k driver. =


We would like to be able to access/know the result of the CCA (clear channel
assessment) operation =

or the level of interference on the carrier when we need.

We have dug into the driver files and concluded that the CCA related values
are likely =

in the firmware or on the registers of the hardware.

And please correct us if we are thinking wrong.

We would appreciate the help if someone can give us some starting points, =

such as the address of the register that stores the carrier sensing values
(CCA values) =

or the result of it (whether the carrier is busy or idle), to investigate.

The chipset we are using is compex WLE900VX-7AA.

We are currently using Ubuntu 14.04.03 with kernel version 4.1.5, =

but we can use any versions of OS and kernel if they support 802.11ac
bandwidth.

Thank you for help in advance.

-------------------------------
Seowoo Jang, Ph.D.
Ubiquitous Network Laboratory
EECS, Seoul National University

CEL=A0=A0=A0+82-10-3723-3401
E-mail=A0swjang@netlab.snu.ac.kr
-------------------------------


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
