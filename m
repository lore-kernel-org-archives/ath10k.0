Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnW6p-0007rC-B4
 for ath10k@lists.infradead.org; Thu, 22 May 2014 16:44:47 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: RE : RE : RE : RE : ath10k: firmware crash in station mode &
 problem DFS
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
Date: Thu, 22 May 2014 19:44:19 +0300
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978E6@srvexch01.SODIELEC.local>
 (Vu Hai NGUYEN's message of "Thu, 22 May 2014 16:40:29 +0200")
Message-ID: <87lhttwyos.fsf@kamboji.qca.qualcomm.com>
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
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> writes:

> I didn't have the option -T in my hostapd, only those: 
> options:                                                                        
>    -h   show this usage                                                         
>    -d   show more debug messages (-dd for even more)                            
>    -B   run daemon in the background                                            
>    -e   entropy file                                                            
>    -g   global control interface path                                           
>    -G   group for control interfaces                                            
>    -P   PID file                                                                
>    -K   include key data in debug messages                                      
>    -t   include timestamps in some debug messages                               
>    -v   show hostapd version                  
> Is it because I don't have package trace installed in my kernel???? 

You need to enable CONFIG_DEBUG_LINUX_TRACING in hostapd to get -T
switch. It's documented here:

http://wireless.kernel.org/en/developers/Documentation/mac80211/tracing

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
