Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iQaKo-00009Q-En
 for ath10k@lists.infradead.org; Fri, 01 Nov 2019 17:03:39 +0000
Received: by mail-oi1-x230.google.com with SMTP id n16so8749873oig.2
 for <ath10k@lists.infradead.org>; Fri, 01 Nov 2019 10:03:38 -0700 (PDT)
MIME-Version: 1.0
From: Tom Psyborg <pozega.tomislav@gmail.com>
Date: Fri, 1 Nov 2019 18:03:36 +0100
Message-ID: <CAKR_QVJ2eHrESLOEqiKxbjr0SoZh3oJydtgcebBOXSpspbquWA@mail.gmail.com>
Subject: [RFC] ath10k: interface combination with monitor
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>

Hi

Is there a way to run monitor mode interface independent on STA/AP
interface presence or their state?
I am using airodump-ng/airmon-ng and I've noticed that while mon
interface is brought up airodump-ng is unable to find any beacons
unless sta interface is brought down. That is with QCA9880 devices,
while with QCA9377 airodump-ng only finds beacons if the sta interface
is associated to an AP.
Does this need firmware change to work or driver changes are sufficient?

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
