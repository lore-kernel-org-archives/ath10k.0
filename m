Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp-out03.msg.oleane.net ([62.161.7.1])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Z0BEL-0003QV-2k
 for ath10k@lists.infradead.org; Wed, 03 Jun 2015 16:09:26 +0000
Received: from smtp08.msg.oleane.net (smtp08.mail.priv [172.17.20.117]) 
 by smtp-out03.msg.oleane.net with ESMTP id t53Fk4gl016920
 for <ath10k@lists.infradead.org>; Wed, 3 Jun 2015 17:46:04 +0200
Received: from acksys.fr ([195.6.104.67]) (authenticated)
 by smtp08.msg.oleane.net (MTA) with ESMTP id t53FOooA005534
 for <ath10k@lists.infradead.org>; Wed, 3 Jun 2015 17:24:50 +0200
Content-class: urn:content-classes:message
Subject: ATH10K and VLAN
Date: Wed, 3 Jun 2015 17:24:50 +0200
Message-ID: <773DB8A82AB6A046AE0195C68612A31901A71F98@sbs2003.acksys.local>
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: ath10k@lists.infradead.org

	I'm testing to send a VLAN frame through ATH10K device.
	I'm using compat wireless 2015-03-09 from openWRT. The ATH10K firmware use=
d is 10.2.4.45

	My test platform is:
		Pc1 : IP 10.101.4.3 (without VLAN)
			VLAN 1 : IP 192.168.5.1

		Equipment in AP mode. The netdev is bridged with eth0

		Equipment in client mode with WDS mode enables. The client is connected t=
o the AP. The netdev is bridged with eth0.
		AP and client use ATH10K wireless card.

		PC2: IP 10.101.4.4 (without VLAN)
			VLAN 1 : IP 192.168.5.2

		The PC1 is connected to the equipment in AP mode and the PC2 is connected=
 to the equipment in client mode.
	=


	I can ping from PC1 to PC2 without vlan (ping 10.101.4.4).
	I cannot ping from PC1 to PC2 with VLAN.
	With tcpdump I checked the vlan frame is sent to the netdev but this frame=
 is not send to the air.

	Is it possible to send a VLAN frame through ATH10K? If no, is it a driver =
limitation or firmware limitation?
		=

	Thanks for your help.

C=E9dric.



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
