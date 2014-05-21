Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-la0-x229.google.com ([2a00:1450:4010:c03::229])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Wn77j-0005l0-ED
 for ath10k@lists.infradead.org; Wed, 21 May 2014 14:04:04 +0000
Received: by mail-la0-f41.google.com with SMTP id e16so1619352lan.14
 for <ath10k@lists.infradead.org>; Wed, 21 May 2014 07:03:34 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F109978DF@srvexch01.SODIELEC.local>
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
Date: Wed, 21 May 2014 16:03:34 +0200
Message-ID: <CALhHN=r0vg3hf+pozRQujmCzYXb7g2YX8Ur-bQ_HQ0-qd=yRAg@mail.gmail.com>
Subject: Re: RE : RE : ath10k: firmware crash in station mode & problem DFS
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

On 21 May 2014 11:43, Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr> wrote:
>>Best if you can use 3rd device as a sniffer and capture airlogs.
>>Could you also send hostapd logs (captured with with -ddt)?
>>We will see if hostapd get this direct probe requests
>
> I thought that hostapd didn't get the probe request as far as what I saw from the logs. (You can find in the attached file the logs for both wpa and hostapd)
>
Thanks for logs,

Seems hostapd try to send probe resp:

1262304186.542126: nl80211: send_mlme - noack=1 freq=0 no_cck=0 offchanok=0 wait
_time=0 fc=0x50 nlmode=3

0x50 - probe resp

I think you will have to check ailogs.

BTW, did you hack somehow ath/regdb.c file? :-)
You can enable WMI logs and check if there is: "mac channel [ ..."
mainly channels list configured. I remember we have similar issue when
hack ath regdb and update channel list wasn't called :)

BR
Janusz


BR
Janusz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
