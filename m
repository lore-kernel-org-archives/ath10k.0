Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vc0-x22b.google.com ([2607:f8b0:400c:c03::22b])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuDVh-0000UM-Uc
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 04:18:10 +0000
Received: by mail-vc0-f171.google.com with SMTP id id10so5564972vcb.16
 for <ath10k@lists.infradead.org>; Mon, 09 Jun 2014 21:17:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnpdcBOrX32Ma7q0OZ5eaPYM31g8VV4HU==nMUqfA2Fzw@mail.gmail.com>
References: <CAEFj986inLh+Upgx-rVF0zviii+yaQZnr9cuMYOXAqEjXrVMvQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FC@srvexch01.SODIELEC.local>
 <CAEFj986wbAp3-7y3ocpYzCWvYU=J0H6fQbrnMA3-qetRruF6RA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FE@srvexch01.SODIELEC.local>
 <CAEFj986pnp2qHu8YuYyHLN66jAy2Mf+AAS=pLsuK6gdq6BU23Q@mail.gmail.com>
 <CA+BoTQnpdcBOrX32Ma7q0OZ5eaPYM31g8VV4HU==nMUqfA2Fzw@mail.gmail.com>
Date: Tue, 10 Jun 2014 12:17:47 +0800
Message-ID: <CAEFj985CuYtOLQtf3j2=CvDTDhqAek351=wThbxpw9ijj5kcnA@mail.gmail.com>
Subject: Re: RE : RE : Bridging problem in ath10k (STA)
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

> Does this reproduce if you have non-bridged STA connected to an AP
> while the STA interface is in promiscuous mode (so that monitor vdev
> is running)? If it doesn't reproduce I'd look for AP configuration
> issue. Does your AP have wds_sta=1?

Oops, I missed out the wds_sta=1 in my second config file. So it seems
that this solve the problem.

Also, I found out that even if I bridge the wlan interface first
before associate to the AP, the CT firmware does not crashed.

---
ChunYeow

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
