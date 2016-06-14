Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1bCpWL-0001nl-BU
 for ath10k@lists.infradead.org; Tue, 14 Jun 2016 14:40:50 +0000
From: "Valo, Kalle" <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: fix potential null dereference bugs
Date: Tue, 14 Jun 2016 14:39:52 +0000
Message-ID: <87d1njzvew.fsf@kamboji.qca.qualcomm.com>
References: <1465563164-783-1-git-send-email-me@bobcopeland.com>
 <CA+BoTQkg+uea_YzUgrVBPhA8uRxNpd29Kd1y1tvt0a-JyOSLQw@mail.gmail.com>
 <1465808939.2434.1.camel@sipsolutions.net>	<20160613130507.GA11074@localhost>
 <1465823880.10050.3.camel@sipsolutions.net>
 <87shwf3mlh.fsf@kamboji.qca.qualcomm.com>	<20160614141606.GA713@localhost>
In-Reply-To: <20160614141606.GA713@localhost> (Bob Copeland's message of "Tue, 
 14 Jun 2016 10:16:06 -0400")
Content-Language: en-US
Content-ID: <569AF54F710B0D47B2E67400FBD54EC3@qualcomm.com>
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
To: Bob Copeland <me@bobcopeland.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-wireless <linux-wireless@vger.kernel.org>, "michal.kazior@tieto.com" <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Bob Copeland <me@bobcopeland.com> writes:

>> > However, with all this, I think I'd simply not take any chances - the
>> > patch isn't exactly invasive and in some cases (for example the first
>> > hunk of the patch) will even improve the code to the point where the
>> > compiler could warn about uninitialized usage of the pointer when the
>> > code gets modified to use it in case of !txq->sta.
>> >
>> > I'd take it, but I guess it's Kalle's decision :)
>> 
>> Yeah, I'm leaning towards Johannes. These are not really invasive.
>
> Thanks, and sorry about the checkpatch -- I did run checkpatch on it but
> for some reason my version only complained about some of them.

I actually have a custom script which enables (and disables) various
checkpatch checks, most likely that's why you didn't see it.

https://github.com/qca/qca-swiss-army-knife/blob/master/tools/scripts/ath10k/ath10k-check

-- 
Kalle Valo
_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
