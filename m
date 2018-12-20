Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from smtp.codeaurora.org ([198.145.29.96])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1ga1Nb-0002QX-Hd
 for ath10k@lists.infradead.org; Thu, 20 Dec 2018 16:41:00 +0000
From: Kalle Valo <kvalo@codeaurora.org>
Subject: Re: [PATCH] ath10k: Move non-fatal warn logs to dbg level
References: <20181129042522.11767-1-govinds@codeaurora.org>
 <CA+ASDXMOqzXk9HrX9AS58cUfKOHeXA7zN_ME3+zDZXQcok_0Tg@mail.gmail.com>
Date: Thu, 20 Dec 2018 18:40:43 +0200
In-Reply-To: <CA+ASDXMOqzXk9HrX9AS58cUfKOHeXA7zN_ME3+zDZXQcok_0Tg@mail.gmail.com>
 (Brian Norris's message of "Fri, 30 Nov 2018 12:59:49 -0800")
Message-ID: <87h8f8talw.fsf@kamboji.qca.qualcomm.com>
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
To: Brian Norris <briannorris@chromium.org>
Cc: govinds@codeaurora.org, linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Brian Norris <briannorris@chromium.org> writes:

> On Wed, Nov 28, 2018 at 8:25 PM Govind Singh <govinds@codeaurora.org> wrote:
>>
>> During driver load below warn logs are printed in the console.
>> Since driver may not implement all wmi events sent by fw and
>> all of them are non-fatal, move this log to debug level to
>> remove un-necessary warn message on console.
>>
>> [  361.887230] ath10k_snoc a000000.wifi: Unknown eventid: 16393
>> [  361.907037] ath10k_snoc a000000.wifi: Unknown eventid: 237569
>>
>> Signed-off-by: Govind Singh <govinds@codeaurora.org>
>
> Alternatively, you could add these ignored commands to wmi-tlv.h, and
> just ignore them specifically. That's better documentation, in case
> new WMI events come along that *are* important to notice when we
> ignore them. There are other recent examples of that sort of patch
> being merged.

I have actually tried to do that (what Brian describes above) during the
last years but the problem is that there are just so many different
firmware branches that it's difficult to keep up in ath10k. So in the
end these warnings just confused the users and they mistakenly thought
this warning message is the cause of their problems. That's why I think
it's best to remove this warning.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
