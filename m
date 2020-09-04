Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from a27-10.smtp-out.us-west-2.amazonses.com ([54.240.27.10])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEEla-0002t7-4C
 for ath10k@lists.infradead.org; Fri, 04 Sep 2020 16:40:47 +0000
From: "Rakesh Pillai" <pillair@codeaurora.org>
References: <1593193990-30366-1-git-send-email-pillair@codeaurora.org>
 <87y2ls4lbf.fsf@codeaurora.org>
In-Reply-To: <87y2ls4lbf.fsf@codeaurora.org>
Subject: RE: [PATCH] ath10k: Use bdf calibration variant for snoc targets
Date: Fri, 4 Sep 2020 16:40:41 +0000
Message-ID: <0101017459fdd62b-791355e4-ea88-4142-96a7-06849bcd7b09-000000@us-west-2.amazonses.com>
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

Hi Kalle,


> -----Original Message-----
> From: Kalle Valo <kvalo@codeaurora.org>
> Sent: Wednesday, September 2, 2020 2:17 PM
> To: Rakesh Pillai <pillair@codeaurora.org>
> Cc: ath10k@lists.infradead.org; linux-wireless@vger.kernel.org; linux-
> kernel@vger.kernel.org
> Subject: Re: [PATCH] ath10k: Use bdf calibration variant for snoc targets
> 
> Rakesh Pillai <pillair@codeaurora.org> writes:
> 
> > Board Data File (BDF) is loaded upon driver boot-up procedure.
> > The right board data file is identified using bus and qmi-board-id.
> >
> > The problem, however, can occur when the (default) board data
> > file cannot fulfill with the vendor requirements and it is
> > necessary to use a different board data file.
> >
> > Add the support to get the variant field from DTSI and
> > use tht information to load the vendor specific BDF.
> >
> > The device tree requires addition strings to define the variant name
> >
> >     wifi@a000000 {
> >             status = "okay";
> >             qcom,ath10k-calibration-variant = "xyz-v2";
> >     };
> >
> >     wifi@a800000 {
> >             status = "okay";
> >             qcom,ath10k-calibration-variant = "xyz-v1";
> >     };
> >
> > This would create the boarddata identifiers for the board-2.bin search
> >
> >  *  bus=snoc,qmi-board-id=16,qmi-chip-id=0,variant=xyz-v1
> >  *  bus=snoc,qmi-board-id=17,qmi-chip-id=0,variant=xyz-v2
> 
> You mention nothing about qmi-chip-id in the commit log. Please document
> what it is and also give some examples what kind of values there can be.


Let me add a bit more details about the chip-id and send v2 for this change.


> 
> > --- a/drivers/net/wireless/ath/ath10k/qmi.c
> > +++ b/drivers/net/wireless/ath/ath10k/qmi.c
> > @@ -576,6 +576,8 @@ static int ath10k_qmi_cap_send_sync_msg(struct
> ath10k_qmi *qmi)
> >  	if (resp->chip_info_valid) {
> >  		qmi->chip_info.chip_id = resp->chip_info.chip_id;
> >  		qmi->chip_info.chip_family = resp->chip_info.chip_family;
> > +	} else {
> > +		qmi->chip_info.chip_id = 0xFF;
> >  	}
> 
> So you hard code chip_id to 0xff if it's not valid. Is it 100%
> guaranteed that there never will be a chip id with 0xff?

0x0 and 0xff are invalid chip id and are are not used.
If the chip_id read fails, we fallback to the default board data.
0xff is used to go to the default board data (Also this is in alignment with
the current implementation of board_id)

Does that make sense ?


> 
> >
> >  	if (resp->board_info_valid)
> > @@ -817,12 +819,18 @@ static void
> ath10k_qmi_event_server_arrive(struct ath10k_qmi *qmi)
> >  static int ath10k_qmi_fetch_board_file(struct ath10k_qmi *qmi)
> >  {
> >  	struct ath10k *ar = qmi->ar;
> > +	int ret;
> >
> >  	ar->hif.bus = ATH10K_BUS_SNOC;
> >  	ar->id.qmi_ids_valid = true;
> >  	ar->id.qmi_board_id = qmi->board_info.board_id;
> > +	ar->id.qmi_chip_id = qmi->chip_info.chip_id;
> 
> To me a safer, and cleaner, option would be to have
> ar->id.qmi_chip_id_valid, and only add qmi-chip-id=%x to the board id if
> qmi_chip_id_valid is true. That way there's not this magic 0xff value
> hardcoded anywhere.
> 
> --
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingp
> atches


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
