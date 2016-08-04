Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-ua0-x241.google.com ([2607:f8b0:400c:c08::241])
 by bombadil.infradead.org with esmtps (Exim 4.85_2 #1 (Red Hat Linux))
 id 1bVFYh-0005DX-Ir
 for ath10k@lists.infradead.org; Thu, 04 Aug 2016 10:07:24 +0000
Received: by mail-ua0-x241.google.com with SMTP id 74so2173155uau.3
 for <ath10k@lists.infradead.org>; Thu, 04 Aug 2016 03:07:01 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAA93jw6j0pBKnm3Fs=D7V1CUsBnhZKKymbk4=UQuFWKuEAs-+Q@mail.gmail.com>
References: <1463489221-24989-1-git-send-email-michal.kazior@tieto.com>
 <1467201146-6844-1-git-send-email-michal.kazior@tieto.com>
 <87zipt1kco.fsf@kamboji.qca.qualcomm.com>
 <CACiydb+yNc-UKVRFR-UxTq-YFBDpEDsa1qWNBGCHpe=_zv8o7g@mail.gmail.com>
 <CAA93jw6j0pBKnm3Fs=D7V1CUsBnhZKKymbk4=UQuFWKuEAs-+Q@mail.gmail.com>
From: Roman Yeryomin <leroi.lists@gmail.com>
Date: Thu, 4 Aug 2016 13:07:00 +0300
Message-ID: <CACiydb+PfbS+Hc79My2HFqdacFtik7_H8d3kFsrST6m1GnSAgA@mail.gmail.com>
Subject: Re: [PATCH] ath10k: disable wake_tx_queue for older devices
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
To: Dave Taht <dave.taht@gmail.com>
Cc: "Valo, Kalle" <kvalo@qca.qualcomm.com>, "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 1 August 2016 at 12:04, Dave Taht <dave.taht@gmail.com> wrote:
> On Mon, Aug 1, 2016 at 1:35 AM, Roman Yeryomin <leroi.lists@gmail.com> wrote:
>> On 7 July 2016 at 19:30, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
>>> Michal Kazior <michal.kazior@tieto.com> writes:
>>>
>>>> Ideally wake_tx_queue should be used regardless as
>>>> it is a requirement for reducing bufferbloat and
>>>> implementing airtime fairness in the future.
>>>>
>>>> However some setups (typically low-end platforms
>>>> hosting QCA988X) suffer performance regressions
>>>> with the current wake_tx_queue implementation.
>>>> Therefore disable it unless it is really
>>>> beneficial with current codebase (which is when
>>>> firmware supports smart pull-push tx scheduling).
>>>>
>>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>>>
>>> I think it's too late to send this to 4.7 anymore (and this due to my
>>> vacation). So I'm planning to queue this to 4.8, but if the feedback is
>>> positive we can always send this to a 4.7 stable release.
>>>
>>
>> Sorry guys, drowned.
>> So, yes, applying this patch does the job. That is gets me to the
>> results similar to
>> https://lists.openwrt.org/pipermail/openwrt-devel/2016-May/041448.html
>>
>> Going to try latest code on same system...
>
> Can you try increasing the quantum to 1514, and reducing the codel
> target to 5ms? (without this patch?)
>

So it was 1514 already...

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
