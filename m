Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mailhost.actiasodielec.fr ([89.91.64.97])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WpDdE-00082k-UE
 for ath10k@lists.infradead.org; Tue, 27 May 2014 09:25:17 +0000
From: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Date: Tue, 27 May 2014 11:21:29 +0200
Subject: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
Message-ID: <EE97821C81277E459BEA5C6384C6F241012F109978F1@srvexch01.SODIELEC.local>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <5370F41A.70202@candelatech.com>
 <CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>
 <53719332.9040700@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978CC@srvexch01.SODIELEC.local>
 <CA+BoTQmxBHbeu=4si9sCkqtXtY6mBHahktVKoWLCuShecjUytw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D0@srvexch01.SODIELEC.local>
 <CA+BoTQnsLGHLHjnr+aFm44qwkPQxNcpuCg0oo75iD=QVsh4U7w@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DA@srvexch01.SODIELEC.local>
 <CA+BoTQnKrBWBUtdw4YB8GQPu5VZuZNc7OgwT5v5_qp=zOqxd_A@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DD@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978DE@srvexch01.SODIELEC.local>
 <CALhHN=qKpm3RRG9S6UF17c3NZZaid4Zo15e0AACnrEgb0f-aqg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DF@srvexch01.SODIELEC.local>
 <CALhHN=r0vg3hf+pozRQujmCzYXb7g2YX8Ur-bQ_HQ0-qd=yRAg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E1@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978E5@srvexch01.SODIELEC.local>
 <CALhHN=oC4LdH0vr31dAZpvFLjZnJJ_Bg2d=pnCved6TKAmwi0A@mail.gmail.com>
 <CALhHN=rw7=nm8ZoMVm1u=nVou1OLY30jUq0G6LvA861Yrknn_Q@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E6@srvexch01.SODIELEC.local>
 <87lhttwyos.fsf@kamboji.qca.qualcomm.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E8@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978E9@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978EA@srvexch01.SODIELEC.local>
 <CALhHN=qsgcL04x+vsXgmHnSr5H-aoQW7oC5Y+NmCZCLS1DWGAQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978F0@srvexch01.SODIELEC.local>
 <CAFED-j=i5uhjqaJYL+dm_ui48EFeHG3isHYSSSo=+3gk-Wa5YQ@mail.gmail.com>,
 <CALhHN=r3eYxgFTRo7zAna3q1qopo21WvzREM=6rQY6hfuQmPeQ@mail.gmail.com>
In-Reply-To: <CALhHN=r3eYxgFTRo7zAna3q1qopo21WvzREM=6rQY6hfuQmPeQ@mail.gmail.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Janusz Dziedzic <janusz.dziedzic@gmail.com>
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "kvalo@qca.qualcomm.com" <kvalo@qca.qualcomm.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> This is set base on what driver/mac80211/cfg80211 report - function
> wpa_driver_nl80211_capa().
> With ath10k and new mac80211 this should be never set. So, seems you still
> have old/wrong modules and system build/configuration problem?
> Check cfg80211.ko/mac80211.ko ... and/or add some prints to driver_nl80211.c

It's just about the module or it can be related to building hostapd too?

>adding ath10k while html was removed :-)

Sorry I don't get this. What do you mean about html here?


NGUYEN Vu Hai
Acita-Sodielec
Route de Mayres - B.P. 9
12100 St GEORGES DE LUZENCON
FRANCE


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
