Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp1.spirent.com ([38.111.148.215] helo=webmail.spirent.com)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YOoRP-00060n-Fc
 for ath10k@lists.infradead.org; Fri, 20 Feb 2015 14:20:27 +0000
From: "Shu, Nick" <Nick.Shu@spirent.com>
Subject: QosControl missing in eapol key exchanging message 
Date: Fri, 20 Feb 2015 14:20:04 +0000
Message-ID: <153F35912E69C446A72CF7D6417EBADE6E794104@SPCCOREXCMBX01.AD.SPIRENTCOM.COM>
Content-Language: en-US
MIME-Version: 1.0
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi, Group:
I'm using a mini PICe wifi AC NIC & ath10k driver to connect to a Cisco AP. Doing a WPA-PSK authentication that has a 4 way handshake.
When I use wireshark to decode the captured wifi message (Qos Key message 2of 4 is from Sta to AP), I noticed that QoS Control section (0x0007) missing in header, that caused wireshark to not be able to decode the message.
Does anybody knows about this? Any particular reason? Does this violate the spec for message building?

Thanks!
Nick Shu
Spirent Communications e-mail confidentiality.
------------------------------------------------------------------------
This e-mail contains confidential and / or privileged information belonging to Spirent Communications plc, its affiliates and / or subsidiaries. If you are not the intended recipient, you are hereby notified that any disclosure, copying, distribution and / or the taking of any action based upon reliance on the contents of this transmission is strictly forbidden. If you have received this message in error please notify the sender by return e-mail and delete it from your system.

Spirent Communications plc
Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.
Tel No. +44 (0) 1293 767676
Fax No. +44 (0) 1293 767677

Registered in England Number 470893
Registered at Northwood Park, Gatwick Road, Crawley, West Sussex, RH10 9XN, United Kingdom.

Or if within the US,

Spirent Communications,
27349 Agoura Road, Calabasas, CA, 91301, USA.
Tel No. 1-818-676- 2300

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
