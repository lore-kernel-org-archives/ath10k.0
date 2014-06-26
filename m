Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-qg0-x22c.google.com ([2607:f8b0:400d:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1X04Sa-0006yi-MV
 for ath10k@lists.infradead.org; Thu, 26 Jun 2014 07:51:09 +0000
Received: by mail-qg0-f44.google.com with SMTP id j107so2737036qga.31
 for <ath10k@lists.infradead.org>; Thu, 26 Jun 2014 00:50:47 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+BoTQnBSS_Oq+1HDfcsD5tekszBwrbt6gOe65tRRieTkzReww@mail.gmail.com>
References: <CABnBrYV8-UY56eEYn7FYEXrNU_SMeMOBXa1fwH9ugOHf_xAq0A@mail.gmail.com>
 <CAJ-Vmokmpi0DGKHvXvjbu9imD1W65fSAzbyXpGrn-9Hu3PTudg@mail.gmail.com>
 <CA+BoTQnBSS_Oq+1HDfcsD5tekszBwrbt6gOe65tRRieTkzReww@mail.gmail.com>
Date: Thu, 26 Jun 2014 00:50:47 -0700
Message-ID: <CAJ-Vmo=6ydGJDAdN8xp=1uSvfcHHBJSFhQwZmBz9zo7D_pzwHA@mail.gmail.com>
Subject: Re: No reorder buffer?
From: Adrian Chadd <adrian@freebsd.org>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Denton Gentry <denton.gentry@gmail.com>

On 26 June 2014 00:47, Michal Kazior <michal.kazior@tieto.com> wrote:
> On 26 June 2014 09:38, Adrian Chadd <adrian@freebsd.org> wrote:
>> ... hm. Well, in normal operation the firmware is supposed to be doing
>> reordering. But I don't think ath10k runs the MAC in normal ethernet
>> pipe mode, right? So a lot of the firmware / hardware offload bits
>> don't work.
>>
>> Can someone verify for me which mode the MAC is in? I forget what was done.
>
> ath10k runs in Native Wifi Rx decap mode if that's what you're
> interested in? But I wouldn't expect it to behave any different than
> 802.3 decap mode other than a different frame headers.
>
> Maybe re-ordering is disabled implicitly when a monitor vdev is
> running in firmware (e.g. when interface is in promisc mode/ in a
> bridge)?

Native wifi Rx decap does disable a bunch of hardware offload
features. Ugh. I'd have to go dig up the firmware and QCA9880 chipset
design docs to figure it out again.

Maybe it's time all y'all ath10k developers came out here to San Jose
for a couple of days for a meet, greet, code and learn session. It'd
give me a reason to re-study all this stuff again. :-)



-a

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
