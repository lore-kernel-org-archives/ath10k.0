Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
MIME-Version: 1.0
In-Reply-To: <CAAnMG+MY=LhfJxxUVdfRNYUW-2R+EXdLm2o6yDcCH0T1brRVxw@mail.gmail.com>
References: <583DD564.8040704@cococorp.com>
 <20161201070908.GB11953@atheros-ThinkPad-T61>
 <58421FA2.2020004@cococorp.com> <20161203124358.GB31861@atheros-ThinkPad-T61>
 <20161203124600.GC31861@atheros-ThinkPad-T61> <5845B325.6060002@cococorp.com>
 <d8eb0ba5828d43dd83030247ba443b88@aphydexm01f.ap.qualcomm.com>
 <58472E7B.7090603@cococorp.com> <58504113.2080702@cococorp.com>
 <5850831D.7020206@cococorp.com>
 <ccf17009a52748c99accdaa005ea837a@NALASEXR01H.na.qualcomm.com>
 <CAAnMG+OmeataRKYRjOjtBXF_1-De-F4zWbUsWoYRhVu02NPrrw@mail.gmail.com>
 <CAJ-Vmo=iLryhOS--PPYCGa9pE2GovPDOXi6xoH22xFOYXXKNVA@mail.gmail.com>
 <CAAnMG+MY=LhfJxxUVdfRNYUW-2R+EXdLm2o6yDcCH0T1brRVxw@mail.gmail.com>
From: Adrian Chadd <adrian@freebsd.org>
Date: Tue, 13 Dec 2016 22:17:57 -0800
Message-ID: <CAJ-VmomEMCxfyy2=440epuTP1rGMaEKBKwPA4qC5V8Hj8LmSbw@mail.gmail.com>
Subject: Re: ath10k firmware crashes in mesh mode on QCA9880
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
To: Alexis Green <agreen@cococorp.com>
Cc: Benjamin Morgan <bmorgan@cococorp.com>, "lede-dev@lists.infradead.org" <lede-dev@lists.infradead.org>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Mohammed Shafi Shajakhan <mohammed@codeaurora.org>, "Nagarajan,
 Ashok Raj" <arnagara@qti.qualcomm.com>, "Manoharan,
 Rajkumar" <rmanohar@qca.qualcomm.com>

Hi!

ok, thanks! I've seen some .. annoying rate control related firmware
crashes if you aren't using 11ac / 11n rates (ie you're /really/
legacy, so I wondered if something similar is going on here.

Thanks!


-a


On 13 December 2016 at 22:06, Alexis Green <agreen@cococorp.com> wrote:
> Hi Adrian,
>
> I have not done much testing of ath10k and ath9k devices in a single
> encrypted mesh recently, but I have a memory of only having this issue
> when communicating between ath10k devices.
>
> Alexis
>
> On Tue, Dec 13, 2016 at 9:53 PM, Adrian Chadd <adrian@freebsd.org> wrote:
>> Hi!
>>
>> Hm! So is there a firmware bug if there are 11n only capable nodes in
>> an 11s mesh?
>>
>>
>>
>> -adrian

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
