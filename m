Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by merlin.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WYd8Y-00063q-Bg
 for ath10k@lists.infradead.org; Fri, 11 Apr 2014 15:13:03 +0000
Received: (from uucp@localhost) by mailhost.actiasodielec.fr id s3BFB8nX021734
 for <ath10k@lists.infradead.org>; Fri, 11 Apr 2014 17:11:08 +0200
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Fri, 11 Apr 2014 17:09:27 +0200
Subject: load module ath10k:  ieee80211 phy0: Failed to initialize wep: -2
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F06CC4837@srvexch01.SODIELEC.local>
References: <53461A8A.4030209@candelatech.com>
 <1397124355-6321-1-git-send-email-michal.kazior@tieto.com>
 <8738hkh193.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=gUBsw43M2at0y7iZU3VhwdjH9EBqzdOmKpxLjjqusPw@mail.gmail.com>,
 <CA+BoTQ=L7Cj5V04RGEFcdGm1rxEO8NOYMEhSRiQNdoBoMTm5Pg@mail.gmail.com>
In-Reply-To: <CA+BoTQ=L7Cj5V04RGEFcdGm1rxEO8NOYMEhSRiQNdoBoMTm5Pg@mail.gmail.com>
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
To: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>

Hello everyone,
I try to load the module of driver ath10k on a cpu marvell 370 which ran linux 3.2.36, my module wifi is  WLE900VX.
These modules was built from backport 3.13.2-1. 
After loading the module, I use the command "lsmod" and saw that 6 modules was loaded.
But my "dmesg" show an error:
ieee80211 phy0: Failed to initialize wep: -2
And the interface ath0 can not be recognized.
Does any one have any idea about this problem????
Thank you in advanced and have a nice weekend :D


NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
