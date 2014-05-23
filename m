Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnnqV-0006Bd-CR
 for ath10k@lists.infradead.org; Fri, 23 May 2014 11:41:08 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Fri, 23 May 2014 13:35:37 +0200
Subject: RE : RE : RE : ath10k: firmware crash in station mode
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F109978EB@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
 <5370F41A.70202@candelatech.com>
 <CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>
 <53719332.9040700@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978CC@srvexch01.SODIELEC.local>
 <CA+BoTQmxBHbeu=4si9sCkqtXtY6mBHahktVKoWLCuShecjUytw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D0@srvexch01.SODIELEC.local>
 <CA+BoTQnsLGHLHjnr+aFm44qwkPQxNcpuCg0oo75iD=QVsh4U7w@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DA@srvexch01.SODIELEC.local>
 <CA+BoTQnKrBWBUtdw4YB8GQPu5VZuZNc7OgwT5v5_qp=zOqxd_A@mail.gmail.com>,
 <CAEFj984iGQpP0_g6b1zR8WSY8KCJZHwFmXOBG-fZyG06FKqB1w@mail.gmail.com>
In-Reply-To: <CAEFj984iGQpP0_g6b1zR8WSY8KCJZHwFmXOBG-fZyG06FKqB1w@mail.gmail.com>
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
To: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>, Michal Kazior <michal.kazior@tieto.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>>> But I wonder if there will be any progress of the firmware in the future for promiscuous so that I can
>>> set up bridge mode?
>>>

>> Beats me. You should ask QCA about the future of ath10k firmware.
>>

>The best you can is use the firmware-2.bin_10.1.467.2-1. It should
>allow you to bridge even in STA mode.

I need to run the command "iw wlan0 set 4addr on" before setup bridge, else my bridge did not work. 
How did you bridge without that command?

Regards,
NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
