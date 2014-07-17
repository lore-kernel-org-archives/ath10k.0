Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X7l1h-0006zz-R9
 for ath10k@lists.infradead.org; Thu, 17 Jul 2014 12:43:10 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Thu, 17 Jul 2014 14:42:40 +0200
Subject: RE : Trouble shooting low rate MCS9 in 802.11ac
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F15C1D7ED@srvexch01.SODIELEC.local>
References: <30258C2D-7A80-42C1-8AE7-713C490ABF05@st-andrews.ac.uk>
 <53C6A1C7.5060004@intec.ugent.be>
 <CA+BoTQ==9HQrPxp3qZGwEm_a3wQY_wMW5ckrbSRu+MkxU1HRgw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F15C1D7EB@srvexch01.SODIELEC.local>,
 <CA+BoTQmENGOcdWTGDU6By-4sXu2o9WNzTuizD=+_bDK14miWqg@mail.gmail.com>
In-Reply-To: <CA+BoTQmENGOcdWTGDU6By-4sXu2o9WNzTuizD=+_bDK14miWqg@mail.gmail.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>The higher the MCS rate the more symbols are packed up per baud which
>means it is more susceptible to interference and corruption.

>You probably don't have an environment clean enough to pull off MCS8
>and MCS9 and you end up with a lot of retransmissions.

>If you're sure you have a clean environment then try putting your
>devices (or them antenna) at different angles against each other and
>different distances.

What did you mean by clean environment? (There's no other 5Ghz wifi in the room,
no radar or device that emit in 5Ghz frequency? I may have other 2.4Ghz wifi in my room, 
hope that it doesn't create any effects)
I'm using an Omnidirectional antennas of PCTEL so I guess it doesn't change anything 
if I change the angle.
One more thing, my processor is already exhausted (0-1% idle) when I obtain 410Mbps in NSS3 -MCS7,
so if I force it to MCS8 or 9, is it possible that a reverse effects is created? The processor gets a lot of work 
to do and then I end up with retransmissions like you said? 
I hope not cause even in VHT40 or VHT20 my processor is not exhausted and MCS9 is still lower than MCS 8 or 7. 

NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE



_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
