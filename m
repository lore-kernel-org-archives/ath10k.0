Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtps.newmedia-net.de ([2a05:a1c0:0:de::167]
 helo=webmail.newmedia-net.de)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iJwid-0007nS-Df
 for ath10k@lists.infradead.org; Mon, 14 Oct 2019 09:32:49 +0000
Subject: Re: [RFC PATCH 0/2] ath10k: provide survey info as accumulated data
References: <20190918124259.17804-1-sven@narfation.org>
 <9a9ec99b-9643-7288-eed5-b549a9fe1487@newmedia-net.de>
 <1614044.H5m0Cyd3Ly@bentobox>
From: Sebastian Gottschall <s.gottschall@newmedia-net.de>
Message-ID: <c51d8bce-d51d-fe77-d756-036f719eb4f4@newmedia-net.de>
Date: Mon, 14 Oct 2019 11:32:41 +0200
MIME-Version: 1.0
In-Reply-To: <1614044.H5m0Cyd3Ly@bentobox>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="windows-1252"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Sven Eckelmann <sven@narfation.org>
Cc: vnaralas@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

10.4 has additional 64 bit cycle counters. see wmi_pdev_bss_chan_info_event

the standard 32 cycle counters do individual wrap around as far as i know

Am 14.10.2019 um 09:07 schrieb Sven Eckelmann:
> On Monday, 14 October 2019 00:15:20 CEST Sebastian Gottschall wrote:
>> i checked your patch on 10.4 based chipsets with 9984. the values are
>> now looking bogus and wrong at all. busy and active time time in ms does
>> increase in hours each second
>> the problem seem to be that your patch is 10.2.4 only related.
>> ath_clean_survey does not trigger on 10.4 so the values double itself
>> each time the event raises since you add the full values and not just a
>> delta on top
> Thanks for the feedback. So we have now a firmware 10.2.4 which is =

> counting
> busy + active up and has wraparound problems. And then we have a 10.4 =

> firmware
> (on QCA9888 and QCA4019) which is clearing everything as expected with
> WMI_BSS_SURVEY_REQ_TYPE_READ_CLEAR=A0 and then we have some 10.4 =

> firmware (one
> QCA9984) which behaves more like ath 10.2.4 firmware but is marked as
> ATH10K_HW_CC_WRAP_SHIFTED_EACH like the QCA4019.
>
> So I have no idea how to fix this when QCA4019 and QCA9984 are currently
> marked the same but behave differently. Does somebody have a overview =

> how the
> different HW versions should behave or is there some special bit in =

> the data
> reported by the firmware which can be used to evaluate the expected =

> behavior?
>
> Kind regards,
> =A0=A0=A0=A0Sven

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
