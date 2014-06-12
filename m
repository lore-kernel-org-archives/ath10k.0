Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wv0kX-0005cF-TZ
 for ath10k@lists.infradead.org; Thu, 12 Jun 2014 08:52:46 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 12 Jun 2014 10:48:13 +0200
Subject: RE : RE : RE : RE : RE : RE : ath10k: firmware crash in station
 mode & problem DFS
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <5386059B.7040301@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F6@srvexch01.SODIELEC.local>,
 <53889A89.90802@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F9@srvexch01.SODIELEC.local>,
 <538CAACA.2030202@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FA@srvexch01.SODIELEC.local>,
 <538E9D26.4040009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FB@srvexch01.SODIELEC
 .local>,<538F9255.1060101@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FF@srvexch01.SODIELEC.local>,
 <5390A9CC.7060400@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997900@srvexch01.SODIELEC.local>,
 <5391E363.50907@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997902@srvexch01.SODIELEC.local>,
 <53972984.8020303@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997906@srvexch01.SODIELEC.local>,
 <53988C53.6030806@candelatech.com>
In-Reply-To: <53988C53.6030806@candelatech.com>
Content-Language: fr-FR
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
To: Ben Greear <greearb@candelatech.com>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Janusz Dziedzic <janusz.dziedzic@gmail.com>

>Can you please try this firmware:
>
>http://www.candelatech.com/downloads/firmware-2-community-scan-X.bin
>
>I have verified that it works fine for me when connecting to an
>AP on a DFS channel.  It should have the bridging fix as well.
>
>There was an inverted beacon-filter setting bug in my code, though that
>also should have been fixed in the previous firmware I sent you.
>
>I might have had some other problem in that older firmware, however.

Thank you, your new firmware work fine with DFS channel and promiscuous mode.
But there is a small bug, with the firmware 10.1 my station can associate with AP directly
after running wpa_supplicant. Your firmware had this:
wlan0: direct probe to (@ mac) (try 1/3)
wlan0: direct probe to (@ mac) (try 2/3)
wlan0: direct probe to (@ mac) (try 3/3)
and I have to run "iw wlan0 scan" to detect the network again and connect to it.
I've tested it with different channels DFS for 2 version of firmware (yours and 10.1)
so I'm quite sure about it.

Thanks,
NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE





_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
