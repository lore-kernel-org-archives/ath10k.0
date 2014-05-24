Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x232.google.com ([2607:f8b0:400c:c03::232])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WoF6H-0007Ml-7K
 for ath10k@lists.infradead.org; Sat, 24 May 2014 16:47:13 +0000
Received: by mail-vc0-f178.google.com with SMTP id ij19so4319236vcb.9
 for <ath10k@lists.infradead.org>; Sat, 24 May 2014 09:46:50 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAJ+vNU0tQ5jPKQXs_psiY+wqb9b77z3hB2F0Sfe1gP4t6Gj70Q@mail.gmail.com>
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBC@srvexch01.SODIELEC.local>
 <5370F41A.70202@candelatech.com>
 <CAHqTa-1xYF=eO-Ai5UMF4BuzzLa84SrzayiGZVmt0jaGs5sZDQ@mail.gmail.com>
 <53719332.9040700@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F0EFBBCBD@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978CC@srvexch01.SODIELEC.local>
 <CA+BoTQmxBHbeu=4si9sCkqtXtY6mBHahktVKoWLCuShecjUytw@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978D0@srvexch01.SODIELEC.local>
 <EE97821C81277E459BEA5C6384C6F241012F109978EF@srvexch01.SODIELEC.local>
 <CAEFj985+HSVXZ611v6ERGxXfn9AOw_OQB37SKVP+o0r0KHP17w@mail.gmail.com>
 <CAJ+vNU0tQ5jPKQXs_psiY+wqb9b77z3hB2F0Sfe1gP4t6Gj70Q@mail.gmail.com>
Date: Sun, 25 May 2014 00:46:50 +0800
Message-ID: <CAEFj9855Yxwv1cuqmkNiww6eVOkKEkYmK=QJouNBf6=cFuJ_YQ@mail.gmail.com>
Subject: Re: TR : ath10k: firmware crash in station mode
From: Yeoh Chun-Yeow <yeohchunyeow@gmail.com>
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
To: Tim Harvey <tharvey@gateworks.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

>
> I am able to reproduce this firmware crash as well very easily. While
> you can avoid it by associating first, then setting 4addr, then adding
> it to a bridge, any dissassociation/reassociation will trigger the
> crash. Additionally its not always convenient to configure things in
> that order - using OpenWrt with the interface bridged and wds enabled
> will always trigger the crash on association.
>
> Tim
>

Yes. I agree with that. But it seems that this is the best we can do
for the time being.

---
Chun-Yeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
