Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ZX8WH-00076A-OJ
 for ath10k@lists.infradead.org; Wed, 02 Sep 2015 13:56:10 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 1/2] ath10k: change beamformee VHT STS capability
References: <1440679653-20289-1-git-send-email-michal.kazior@tieto.com>
 <CACKGw+FU0tQ4HZ0O=AB8uo-HyNshr0zjd-Hb+4NytpzsOH4TdQ@mail.gmail.com>
 <CACKGw+GQKt3frfGxU=M8XLg6adM5GVBasPd5OrwrGMaCvNsvzA@mail.gmail.com>
Date: Wed, 2 Sep 2015 16:55:23 +0300
In-Reply-To: <CACKGw+GQKt3frfGxU=M8XLg6adM5GVBasPd5OrwrGMaCvNsvzA@mail.gmail.com>
 (Bartosz Markowski's message of "Wed, 2 Sep 2015 13:25:04 +0200")
Message-ID: <87d1y1lyd0.fsf@kamboji.qca.qualcomm.com>
MIME-Version: 1.0
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
To: Bartosz Markowski <bartosz.markowski@tieto.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, ath10k <ath10k@lists.infradead.org>

Bartosz Markowski <bartosz.markowski@tieto.com> writes:

> On 28 August 2015 at 14:56, Bartosz Markowski
> <bartosz.markowski@tieto.com> wrote:
>> On 27 August 2015 at 14:47, Michal Kazior <michal.kazior@tieto.com> wrote:
>>> From: Bartosz Markowski <bartosz.markowski@tieto.com>
>>>
>>> All beamformee supporting chips have the ability to support
>>> VHT NDP in up to 4 STSs. Change the published beamformee
>>> STS cap accordingly to 3 as it should be Nsts-1.
>>>
>>> This makes it possible to actually make full use
>>> of. e.g. a 4SS MU-MIMO capable AP.
>>>
>>> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>> ---
>>
>> Kalle, please drop this one for now. It looks like we need to discuss
>> about this a bit more still.
>
> I have sent a follow up on this, splitting it into 2 patches (vht nsts
> and sounding dimensions), addressing the concerns raised about the
> lack of firmware passing the needed bits in vht_cap_info.

Ok, patch 1 dropped. I assume patch 2 is still valid.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
