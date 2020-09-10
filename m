Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-185.smtp-out.us-west-2.amazonses.com ([54.240.27.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kGMMa-00045m-5l
 for ath10k@lists.infradead.org; Thu, 10 Sep 2020 13:11:45 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1593193990-30366-1-git-send-email-pillair@codeaurora.org>	<87y2ls4lbf.fsf@codeaurora.org>	<0101017459fdd62b-791355e4-ea88-4142-96a7-06849bcd7b09-000000@us-west-2.amazonses.com>
 <87k0x51rz3.fsf@codeaurora.org>
In-Reply-To: <87k0x51rz3.fsf@codeaurora.org>
Subject: RE: [PATCH] ath10k: Use bdf calibration variant for snoc targets
Date: Thu, 10 Sep 2020 13:11:39 +0000
Message-ID: <0101017478249b99-fc94cd2c-c680-410a-8762-fd0ef9bdce04-000000@us-west-2.amazonses.com>
MIME-Version: 1.0
Content-Language: en-us
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
To: 'Kalle Valo' <kvalo@codeaurora.org>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org, ath10k@lists.infradead.org



> -----Original Message-----
> From: Kalle Valo <kvalo@codeaurora.org>
> Sent: Monday, September 7, 2020 9:48 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: linux-wireless@vger.kernel.org; linux-kernel@vger.kernel.org;
> ath10k@lists.infradead.org
> Subject: Re: [PATCH] ath10k: Use bdf calibration variant for snoc targets
> 
> "Rakesh Pillai" <pillair@codeaurora.org> writes:
> 
> >> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> >> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> >> > @@ -576,6 +576,8 @@ static int
> ath10k_qmi_cap_send_sync_msg(struct
> >> ath10k_qmi *qmi)
> >> >  	if (resp->chip_info_valid) {
> >> >  		qmi->chip_info.chip_id = resp->chip_info.chip_id;
> >> >  		qmi->chip_info.chip_family =
resp->chip_info.chip_family;
> >> > +	} else {
> >> > +		qmi->chip_info.chip_id = 0xFF;
> >> >  	}
> >>
> >> So you hard code chip_id to 0xff if it's not valid. Is it 100%
> >> guaranteed that there never will be a chip id with 0xff?
> >
> > 0x0 and 0xff are invalid chip id and are are not used.
> > If the chip_id read fails, we fallback to the default board data.
> > 0xff is used to go to the default board data (Also this is in alignment
with
> > the current implementation of board_id)
> >
> > Does that make sense ?
> 
> I'm a bit hesitant, over the years I have seen cases so many cases where
> "foo is not used anywhere" and later that foo is actually used
> somewhere. 0xff means that there's only 254 different values, but I
> guess there are not that many chip ids? So a chip id is very different
> from a board id, right?

Yes that's correct.
Chip id is already being used in case of qca6174 (pci bus)
We are bringing this to snoc bus chipset (WCN3990)

> 
> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingp
> atches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
