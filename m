Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WvNGL-0005JF-4S
 for ath10k@lists.infradead.org; Fri, 13 Jun 2014 08:55:07 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Fri, 13 Jun 2014 10:50:16 +0200
Subject: RE : ath10k: firmware crash in station mode & problem DFS
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F1099790A@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
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
 <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>,
 <539A0C06.6050105@candelatech.com>
In-Reply-To: <539A0C06.6050105@candelatech.com>
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

>I put a new series of patches (one build for every commit in my tree)
>here.  This has the scan fix in place (at around build 70 or so)
>so hopefully a bisect will work OK for you.
>
>http://www.candelatech.com/downloads/ath10k-fw-all-images/
>
>If you bisect the problem, please let me know the results
>and I'll try to track down the problem.

Thanks, the different is between the 61th and 62th commit. I have to type "iw wlan0 scan" for the 62th commit firmware to connect after running wpa_supp.
They all had: 
wlan0: CTRL-EVENT-SCAN-STARTED
wlan0: SME: Trying to authenticate with 04:f0:21:0e:38:be (SSID='ath10k' freq=5280 MHz)
wlan0: authenticate with 04:f0:21:0e:38:be
wlan0: direct probe to 04:f0:21:0e:38:be (try 1/3)   
wlan0: direct probe to 04:f0:21:0e:38:be (try 2/3)
wlan0: direct probe to 04:f0:21:0e:38:be (try 3/3)
wlan0: authentication with 04:f0:21:0e:38:be timed out

But the first firmware continue to do this: 
wlan0: SME: Trying to authenticate with 04:f0:21:0e:38:be (SSID='ath10k' freq=5280 MHz) 
wlan0: authenticate with 04:f0:21:0e:38:be    
wlan0: authenticated
 wlan0: Trying to associate with 04:f0:21:0e:38:be (try 1/3)
 wlan0: associate with 04:f0:21:0e:38:be
 wlan0: associated  

While the second one keeps saying:
wlan0: CTRL-EVENT-SCAN-STARTED

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
