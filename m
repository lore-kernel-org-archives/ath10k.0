Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out06.msg.oleane.net ([62.161.7.4])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1a1L0L-000721-4l
 for ath10k@lists.infradead.org; Tue, 24 Nov 2015 21:20:02 +0000
Content-class: urn:content-classes:message
Subject: ATH10 firmware question
Date: Tue, 24 Nov 2015 19:07:28 +0100
Message-ID: <773DB8A82AB6A046AE0195C68612A31901C5AFA5@sbs2003.acksys.local>
MIME-Version: 1.0
From: "Cedric VONCKEN" <cedric.voncken@acksys.fr>
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
Cc: linux-wireless@vger.kernel.org

	Hi, 

	I have a simple test platform. 
	One PC connected to an equipment. This equipment is set in AP
mode.
	Another PC connected to another equipment. This equipment is set
in STA + WDS mode.

	Both equipment use the same openwrt Firmware (compat
2015-07-21), I only changed the ath10k firmware (in
/lib/firmware/ath10k/...).
	Both equipment has the same hardware.
	I used a clear channel, and VHT80.
	The radio was connected with a coaxial cable and I placed 40 dBm
attenuation per Rf chain.
	I used the WLN350NX radio card from compex.
	
	First test : ATH10K firmware 10.2.4.70-2 on both equipment
		An iperf from PC connected to the AP to the PC connected
to the STA give 919 Mbps.
		An iperf from PC connected to the STA to the PC
connected to the AP give 500 Mbps.

	Second test : ATHK firmware 10.2.4.70.10-2 on both equipment
		An iperf from PC connected to the AP to the PC connected
to the STA give 921 Mbps.
		An iperf from PC connected to the STA to the PC
connected to the AP give 441 Mbps.

	If I cross the computer I have the same result. I did several
time these test and I always have the same result.

	Is it the expected result?
	What is the recommanded firmware version for each mode?
	
	Thanks for your help.

	Cedric Voncken.
	







_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
