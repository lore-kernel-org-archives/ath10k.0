Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ig0-x235.google.com ([2607:f8b0:4001:c05::235])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZepEm-0003Ql-AJ
 for ath10k@lists.infradead.org; Wed, 23 Sep 2015 18:57:53 +0000
Received: by igcrk20 with SMTP id rk20so106032565igc.1
 for <ath10k@lists.infradead.org>; Wed, 23 Sep 2015 11:57:31 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <019a01d0f631$6d01cf90$47056eb0$@wriba.com>
References: <019a01d0f631$6d01cf90$47056eb0$@wriba.com>
Date: Wed, 23 Sep 2015 11:57:31 -0700
Message-ID: <CAJ-VmomTFHgcfKghoYSe_8WJ9gwq+sZg_pYCv3HC2UVxVe2rnQ@mail.gmail.com>
Subject: Re: QCA9880/9890 rfkill
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
To: William Riba <wriba@wriba.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Hi,

The GPIO line needs to be hooked in via the relevant EEPROM/OTP
setting so the firmware programs things in correctly.

Go dump the OTP and see what the rfkill firmware line is.



-adrian


On 23 September 2015 at 11:55, William Riba <wriba@wriba.com> wrote:
> Does anybody know whether rfkill in its hard block flavor is supported in
> any QCA9880/9890 based device and/or firmware load? While vendors refer to
> the WiFi disable/GPIO line in their reference schematics, it is not
> functional.  What I see after testing multiple cards is if the line is
> asserted during operation, there seems to be no effect. If it is asserted at
> boot-up, the device does not enumerate on the PCI bus.
>
> If Qualcomm does not intend to support this functionality anymore it would
> be nice to know. Hard kills are a regulatory requirement for certain
> applications. While we would like to use a QCA9890 in a new application,
> there's no way it could make it through qualifications with its current
> operation.  Any additional information on this would be welcome. Thanks.
>
>
> _______________________________________________
> ath10k mailing list
> ath10k@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/ath10k

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
