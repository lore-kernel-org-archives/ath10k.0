Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YAevi-00030J-Hb
 for ath10k@lists.infradead.org; Mon, 12 Jan 2015 13:21:15 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: add additional fw build version to info print
References: <1420716572-23826-1-git-send-email-michal.kazior@tieto.com>
 <87vbkccg3s.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQk6W1+qi3PY4PjG209L+SZsFc6ktd=eQMKqhrSYpi2AUw@mail.gmail.com>
Date: Mon, 12 Jan 2015 15:20:41 +0200
In-Reply-To: <CA+BoTQk6W1+qi3PY4PjG209L+SZsFc6ktd=eQMKqhrSYpi2AUw@mail.gmail.com>
 (Michal Kazior's message of "Mon, 12 Jan 2015 14:10:41 +0100")
Message-ID: <87mw5oceza.fsf@kamboji.qca.qualcomm.com>
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
To: Michal Kazior <michal.kazior@tieto.com>
Cc: linux-wireless <linux-wireless@vger.kernel.org>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 12 January 2015 at 13:56, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
> [...]
>>>  void ath10k_print_driver_info(struct ath10k *ar)
>>>  {
>>> -     ath10k_info(ar, "%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d wmi %d cal %s max_sta %d\n",
>>> +     ath10k_info(ar, "%s (0x%08x, 0x%08x) fw %s api %d htt %d.%d wmi %d cal %s max_sta %d build %u.%u.%u.%u\n",
> [...]
>>
>> So now we print two different firmware versions to the user? That's just
>> confusing. It's ok to print this build id in debug level, but not in
>> info level. From user's point of view we should have only one firmware
>> version.
>
> I guess we shouldn't be printing htt version then too. Nevertheless I
> understand your concern.

Yeah, but htt version is an interface version and I'm having a hard time
to believe that someone will mistake that as the actual firmware
version.

But what people confuse is the FW API version. When I ask what firmware
version you have way too often I get "firmware-3.bin" as a reply :) But
I have no ideas how to solve that.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
