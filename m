Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ve0-x22f.google.com ([2607:f8b0:400c:c01::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WuGO3-0005zg-LQ
 for ath10k@lists.infradead.org; Tue, 10 Jun 2014 07:22:28 +0000
Received: by mail-ve0-f175.google.com with SMTP id us18so5495293veb.20
 for <ath10k@lists.infradead.org>; Tue, 10 Jun 2014 00:22:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87tx7tckog.fsf@kamboji.qca.qualcomm.com>
References: <CAEFj986inLh+Upgx-rVF0zviii+yaQZnr9cuMYOXAqEjXrVMvQ@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FC@srvexch01.SODIELEC.local>
 <CAEFj986wbAp3-7y3ocpYzCWvYU=J0H6fQbrnMA3-qetRruF6RA@mail.gmail.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FE@srvexch01.SODIELEC.local>
 <CAEFj986pnp2qHu8YuYyHLN66jAy2Mf+AAS=pLsuK6gdq6BU23Q@mail.gmail.com>
 <CA+BoTQnpdcBOrX32Ma7q0OZ5eaPYM31g8VV4HU==nMUqfA2Fzw@mail.gmail.com>
 <CAEFj985CuYtOLQtf3j2=CvDTDhqAek351=wThbxpw9ijj5kcnA@mail.gmail.com>
 <87tx7tckog.fsf@kamboji.qca.qualcomm.com>
Date: Tue, 10 Jun 2014 15:22:05 +0800
Message-ID: <CAEFj9877Aj+Ka0SGd_HTBPva0Yegd-OjHNBWaowELVgN5exhzQ@mail.gmail.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>, Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Ok, I have added this in the wiki page.

----
ChunYeow

On Tue, Jun 10, 2014 at 3:01 PM, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Yeoh Chun-Yeow <yeohchunyeow@gmail.com> writes:
>
>>> Does this reproduce if you have non-bridged STA connected to an AP
>>> while the STA interface is in promiscuous mode (so that monitor vdev
>>> is running)? If it doesn't reproduce I'd look for AP configuration
>>> issue. Does your AP have wds_sta=1?
>>
>> Oops, I missed out the wds_sta=1 in my second config file. So it seems
>> that this solve the problem.
>
> It would be good if someone could add a section to the wiki how to
> configure this:
>
> http://wireless.kernel.org/en/users/Drivers/ath10k/configuration
>
> --
> Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
