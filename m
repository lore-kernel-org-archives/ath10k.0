Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VgaQ5-00085C-LM
 for ath10k@lists.infradead.org; Wed, 13 Nov 2013 13:23:46 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH] ath10k: remove htt rx amsdu clear retry bit hack
References: <20131113112810.5221.69685.stgit@localhost6.localdomain6>
 <CA+BoTQkLsbwEAX6RomC_ZA-rtL6q1Q871=9n-Mgry=AZgrKs6Q@mail.gmail.com>
Date: Wed, 13 Nov 2013 15:23:18 +0200
In-Reply-To: <CA+BoTQkLsbwEAX6RomC_ZA-rtL6q1Q871=9n-Mgry=AZgrKs6Q@mail.gmail.com>
 (Michal Kazior's message of "Wed, 13 Nov 2013 12:38:04 +0100")
Message-ID: <87bo1o77w9.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless <linux-wireless@vger.kernel.org>, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

>> -       /* FIXME: Hopefully this is a temporary measure.
>> -        *
>> -        * Reporting individual A-MSDU subframes means each reported frame
>> -        * shares the same sequence number.
>> -        *
>> -        * mac80211 drops frames it recognizes as duplicates, i.e.
>> -        * retransmission flag is set and sequence number matches sequence
>> -        * number from a previous frame (as per IEEE 802.11-2012: 9.3.2.10
>> -        * "Duplicate detection and recovery")
>> -        *
>> -        * To avoid frames being dropped clear retransmission flag for all
>> -        * received A-MSDUs.
>> -        *
>> -        * Worst case: actual duplicate frames will be reported but this should
>> -        * still be handled gracefully by other OSI/ISO layers. */
>> -       hdr->frame_control &= cpu_to_le16(~IEEE80211_FCTL_RETRY);
>> -
>>         first = skb;
>>         while (skb) {
>>                 void *decap_hdr;
>>
>
> You're missing RX_FLAG_AMSDU_MORE. All subframes (except the last one)
> from an A-MSDU that are reported separately must have the bit set in
> status->flag. Only then mac80211 can apply retransmission/duplication
> check properly.

I'll send v2, thanks for the review.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
