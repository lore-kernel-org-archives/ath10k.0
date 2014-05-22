Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x234.google.com ([2a00:1450:4010:c04::234])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WnRxO-0006db-1X
 for ath10k@lists.infradead.org; Thu, 22 May 2014 12:18:47 +0000
Received: by mail-lb0-f180.google.com with SMTP id p9so2537201lbv.39
 for <ath10k@lists.infradead.org>; Thu, 22 May 2014 05:18:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978E5@srvexch01.SODIELEC.local>
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
 <CA+BoTQnKrBWBUtdw4YB8GQPu5VZuZNc7OgwT5v5_qp=zOqxd_A@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DD@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978DE@srvexch01.SODIELEC.local>
 <CALhHN=qKpm3RRG9S6UF17c3NZZaid4Zo15e0AACnrEgb0f-aqg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978DF@srvexch01.SODIELEC.local>
 <CALhHN=r0vg3hf+pozRQujmCzYXb7g2YX8Ur-bQ_HQ0-qd=yRAg@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978E1@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978E5@srvexch01.SODIELEC.local>
Date: Thu, 22 May 2014 14:18:18 +0200
Message-ID: <CALhHN=oC4LdH0vr31dAZpvFLjZnJJ_Bg2d=pnCved6TKAmwi0A@mail.gmail.com>
Subject: Re: RE : RE : RE : ath10k: firmware crash in station mode & problem
 DFS
From: Janusz Dziedzic <janusz.dziedzic@tieto.com>
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
Cc: Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 22 May 2014 10:06, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>
>>>Thanks for logs,
>
>>>Seems hostapd try to send probe resp:
>
>>>1262304186.542126: nl80211: send_mlme - noack=1 freq=0 no_cck=0 offchanok=0 wait
>>>_time=0 fc=0x50 nlmode=3
>
>>>0x50 - probe resp
>
>>>I think you will have to check ailogs.
>
>>Thanks, I'll try it with wireshark but can you give me the detail that which information that I've to look in the frame? We tried it before but there are a lot of frames
> and i'm confused.
>
> We could see the probe request from the station but not the probe response from the AP.
> THere are 2 airlogs that we captured from wireshark for the canal36 (non DFS) and canal 56 (DFS) in the attached file
>

Could you get trace log with debug_mask = 0xffffff3f?

You can also start hostapd with -ddt -T then we will have all logs in trace :)
You can also add traces from mac80211, cfg80211

Here description:
http://wireless.kernel.org/en/users/Drivers/ath10k/debug


BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
