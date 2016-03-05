Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1ac8u9-0007i6-Mh
 for ath10k@lists.infradead.org; Sat, 05 Mar 2016 09:53:46 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: QCA6174 firmware crash in monitor mode
Date: Sat, 5 Mar 2016 09:53:11 +0000
Message-ID: <87h9glw8sd.fsf@kamboji.qca.qualcomm.com>
References: <20160213063926.GA1767@darkstar>
 <8737s7372f.fsf@kamboji.qca.qualcomm.com>	<20160305064544.GA1809@darkstar>
In-Reply-To: <20160305064544.GA1809@darkstar> (gloudon jamie's message of
 "Sat, 5 Mar 2016 02:46:12 -0400")
Content-Language: en-US
Content-ID: <5331F8C58300784E81D941DA0C107C3F@qualcomm.com>
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
To: "gloudon.jamie@gmail.com" <gloudon.jamie@gmail.com>
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

gloudon.jamie@gmail.com writes:

> On Thu, Mar 03, 2016 at 03:38:37PM +0000, Valo, Kalle wrote:
>> gloudon.jamie@gmail.com writes:
>> 
>> > QCA6147 monitor mode stopped working ever since after kernel v4.3.
>> > Here is the firmware crash log:

[...]

>> Does this patch fix it?
>> 
>> ath10k: fix firmware assert in monitor mode
>> 
>> https://patchwork.kernel.org/patch/8481281/
>> 
>> -- 
>> Kalle Valo
>
> Yes, the patch works. Thanks! Forgot to CC ath10k mailing list.

Great, thanks for confirming. I'll send the patch also to stable

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
