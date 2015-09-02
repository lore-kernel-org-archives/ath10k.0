Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-yk0-x22a.google.com ([2607:f8b0:4002:c07::22a])
 by merlin.infradead.org with esmtps (Exim 4.85 #2 (Red Hat Linux))
 id 1ZX6AW-0002I1-1Y
 for ath10k@lists.infradead.org; Wed, 02 Sep 2015 11:25:32 +0000
Received: by ykcf206 with SMTP id f206so5860457ykc.3
 for <ath10k@lists.infradead.org>; Wed, 02 Sep 2015 04:25:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CACKGw+FU0tQ4HZ0O=AB8uo-HyNshr0zjd-Hb+4NytpzsOH4TdQ@mail.gmail.com>
References: <1440679653-20289-1-git-send-email-michal.kazior@tieto.com>
 <CACKGw+FU0tQ4HZ0O=AB8uo-HyNshr0zjd-Hb+4NytpzsOH4TdQ@mail.gmail.com>
Date: Wed, 2 Sep 2015 13:25:04 +0200
Message-ID: <CACKGw+GQKt3frfGxU=M8XLg6adM5GVBasPd5OrwrGMaCvNsvzA@mail.gmail.com>
Subject: Re: [PATCH 1/2] ath10k: change beamformee VHT STS capability
From: Bartosz Markowski <bartosz.markowski@tieto.com>
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
To: ath10k <ath10k@lists.infradead.org>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>

On 28 August 2015 at 14:56, Bartosz Markowski
<bartosz.markowski@tieto.com> wrote:
> On 27 August 2015 at 14:47, Michal Kazior <michal.kazior@tieto.com> wrote:
>> From: Bartosz Markowski <bartosz.markowski@tieto.com>
>>
>> All beamformee supporting chips have the ability to support
>> VHT NDP in up to 4 STSs. Change the published beamformee
>> STS cap accordingly to 3 as it should be Nsts-1.
>>
>> This makes it possible to actually make full use
>> of. e.g. a 4SS MU-MIMO capable AP.
>>
>> Signed-off-by: Bartosz Markowski <bartosz.markowski@tieto.com>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>> ---
>
> Kalle, please drop this one for now. It looks like we need to discuss
> about this a bit more still.

I have sent a follow up on this, splitting it into 2 patches (vht nsts
and sounding dimensions), addressing the concerns raised about the
lack of firmware passing the needed bits in vht_cap_info.

Bartosz

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
