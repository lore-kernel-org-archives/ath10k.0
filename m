Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bAbpV-0004pA-Fl
 for ath10k@lists.infradead.org; Wed, 08 Jun 2016 11:39:26 +0000
Received: by mail-vk0-x236.google.com with SMTP id d64so7018978vkb.0
 for <ath10k@lists.infradead.org>; Wed, 08 Jun 2016 04:39:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <87inxrzqa5.fsf@kamboji.qca.qualcomm.com>
References: <1463489221-24989-1-git-send-email-michal.kazior@tieto.com>
 <87inxrzqa5.fsf@kamboji.qca.qualcomm.com>
From: Roman Yeryomin <leroi.lists@gmail.com>
Date: Wed, 8 Jun 2016 14:39:03 +0300
Message-ID: <CACiydbLvke0UxJbg2sn0q-=FwXpmX+FKUV7wwEMT=qUYekJrJA@mail.gmail.com>
Subject: Re: [RFC/RFT] ath10k: disable wake_tx_queue for older devices
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
To: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 2 June 2016 at 16:14, Valo, Kalle <kvalo@qca.qualcomm.com> wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
>
>> Some setups suffer performance regressions with
>> current wake_tx_queue implementation.
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>> ---
>> Hi Roman,
>>
>> Can you give this patch a try and see if it helps
>> with your performance problems, please?
>
> Did anyone seeing the performance regression manage to test this? It
> would be good to get feedback, good or bad, before I push this to 4.7.
>
> Full patch here:
>
> https://patchwork.kernel.org/patch/9111981/

Sorry, didn't try yet, bad timing for me :(
Will try to test by the end of the week

Regards,
Roman

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
