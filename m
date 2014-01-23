Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail-lb0-x230.google.com ([2a00:1450:4010:c04::230])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1W6JoD-00008Q-5v
 for ath10k@lists.infradead.org; Thu, 23 Jan 2014 12:55:02 +0000
Received: by mail-lb0-f176.google.com with SMTP id w7so1400686lbi.35
 for <ath10k@lists.infradead.org>; Thu, 23 Jan 2014 04:54:36 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <87zjmm50ve.fsf@kamboji.qca.qualcomm.com>
References: <1390477701-16843-1-git-send-email-marek.puzyniak@tieto.com>
 <87zjmm50ve.fsf@kamboji.qca.qualcomm.com>
Date: Thu, 23 Jan 2014 13:54:35 +0100
Message-ID: <CADnKcVh7WcxwhRpep0nhm5G2P=OZE47Qof-9BH=HcQ+UA=COyg@mail.gmail.com>
Subject: Re: [PATCH v2] ath10k: implement and use new beacon method
From: Marek Puzyniak <marek.puzyniak@tieto.com>
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
To: Kalle Valo <kvalo@qca.qualcomm.com>
Cc: "linux-wireless@vger.kernel.org" <linux-wireless@vger.kernel.org>, Michal Kazior <michal.kazior@tieto.com>, ath10k@lists.infradead.org

On 23 January 2014 13:38, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
> Marek Puzyniak <marek.puzyniak@tieto.com> writes:
>
>> From: Michal Kazior <michal.kazior@tieto.com>
>>
>> Until now ath10k used a copy-by-value beacon
>> submission.
>>
>> The new method passes a DMA address via WMI
>> command only. This command contains additional
>> metadata that fixes AP behaviour with regard
>> to powersave buffering.
>>
>> This also fixes strange bug when multicast traffic
>> would freeze TX indefinitely.
>>
>> Signed-off-by: Michal Kazior <michal.kazior@tieto.com>
>> Signed-off-by: Marek Puzyniak <marek.puzyniak@tieto.com>
>> ---
>>
>> v2:
>>  -rebased,
>>  -beacon send function refactored,
>>  -comments moved before field in structure declaration.
>
> I had a conflict when I was applying this to ath-next-test branch for
> pending patches. Can you please double check that I didn't break
> anything:
>
> https://github.com/kvalo/ath/commit/311f8996ada0e9ff94d5b122b1f022b72e0cdb39
It is OK.
>
> --
> Kalle Valo
Marek

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
