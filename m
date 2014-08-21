Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XKRPY-0000h1-Kd
 for ath10k@lists.infradead.org; Thu, 21 Aug 2014 12:24:13 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 21 Aug 2014 14:23:34 +0200
Subject: RE : RE : RE : Trouble shooting low rate MCS9 in 802.11ac
Message-ID: <EE97821C81277E459BEA5C6384C6F241014DDDD4DC38@srvexch01.SODIELEC.local>
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
 <CACKGw+HM-VYpotQGcTsanebvfU-4iGocOpbbGak7iUDb7sUURA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EC@srvexch01.SODIELEC.local>
 <CACKGw+HraUvPSVprRQCEh0=MRaiahpGde9wUj-w5pbDtXSj8Yw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EE@srvexch01.SODIELEC.local>
 <CAJ-Vmon+TC_TouvoAX3kZT5x+crrStHLmcjCfOeGHvC5eszbTA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EF@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F5@srvexch01.SODIELEC.local>
 <53D252B4.9070704@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7F8@srvexch01.SODIELEC.local>
 <53D6757A.8040803@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7FE@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D800@srvexch01.SODIELEC.local>
 <CA+BoTQ=QscHgrk5bbWugjdnVGh=T_L-psEPKToYHOdKGcQZi7A@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241014DDDD4DC35@srvexch01.SODIELEC.local>
 <53F396F1.8070906@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241014DDDD4DC37@srvexch01.SODIELEC.local>,
 <87sikr43k8.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <87sikr43k8.fsf@kamboji.qca.qualcomm.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Adrian Chadd <adrian@freebsd.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Michal Kazior <michal.kazior@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Ben Greear <greearb@candelatech.com>, Bartosz Markowski <bartosz.markowski@tieto.com>

>>>What do you get for UDP? That seems like pretty good TCP throughput.

>> In VHT80 mode and rate forced to NSS3:MCS7, I can obtain 750 Mbps with
>> less than 1% data lost (in both way, AP to STA and vice versa).
>> Normally I can obtain 2/3 theory rate in practical (for expl NSS3:MCS3
>> has 390 Mbps in theory, and if I force to that rate, my TCP throughput
>> is around 270 Mbps). So I should obtain 650 Mbps in practical for TCP
>> with NSS3:MCS7 (975 Mbps in theory). 570 Mbps is so far to 650 Mbps :(

>Forcing the data rate isn't really optimal. Have you tried 10.2
>firmware? I was told it has improvements in the rate control algorithm.

Yes but it doesn't help, even worse. 
With 10.1 firmware, I can go up to 610 Mbps TCP (NSS3:MCS7 and checksum off load disabled on interface ethernet 
of the PC which connects to my station's device, I just discover it, before my rate was ~ 570 Mbps). 
With 10.2 firmware and the same config, my highest through put is only around 560 Mbps. But there is an improvement 
that the rate of MCS8 and MCS9 is not much lower than MCS7 as in 10.1 firmware. Here is a small compare between 10.1
and 10.2 (always with NSS3)
MCS 7: 610 vs 560 Mbps
MCS 8: 530 vs 560 Mbps (MCS8 got the same rate as MCS7 with 10.2 firmware)
MCS 9: 410 vs 510 Mbps 

But captured log from Wireshark still shows me VHT capab is between MCS 0-9 but VHT operation is only between MCS 0-7. 
And the 10.2 firmware still crashed with station on promiscuous mode. There is another bug that I also saw in 10.2 firmware,
after a moment that my STA connected to the AP, I lost the connection (pinging non success) and this message keeps printing:
ath10k: failed to flush transmit queue (skip 0 ar-state 1): 0

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE




_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
