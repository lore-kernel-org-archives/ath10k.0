Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth01.qualcomm.com ([65.197.215.72])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WqKAn-0000K5-El
 for ath10k@lists.infradead.org; Fri, 30 May 2014 10:36:30 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC PATCH 2/2] ath10k: add testmode
References: <20140528091832.8030.93169.stgit@potku.adurom.net>
 <20140528091956.8030.46201.stgit@potku.adurom.net>
 <CA+BoTQnLPua6Mds+ywPY==9QtnHbuucVamDYpWnfwKiC7J=9dQ@mail.gmail.com>
 <87ha48693v.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQ=rNe_xcmp6yGsE1iGoRnGq_ZksfHg6JW_-U1iK3NszjQ@mail.gmail.com>
 <87ioon4m42.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQmM1F4c34nzSZ4H+0qF=RLg6iA0mr1E=U3q-EoD+n8g_Q@mail.gmail.com>
Date: Fri, 30 May 2014 13:35:56 +0300
In-Reply-To: <CA+BoTQmM1F4c34nzSZ4H+0qF=RLg6iA0mr1E=U3q-EoD+n8g_Q@mail.gmail.com>
 (Michal Kazior's message of "Fri, 30 May 2014 12:22:17 +0200")
Message-ID: <87a99z4kqb.fsf@kamboji.qca.qualcomm.com>
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
Cc: "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 30 May 2014 12:06, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> On 29 May 2014 14:51, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>>
>>>> BTW, please edit your quotes. It's pain to find your comments from a 700
>>>> line monster :)
>>
>> This request still stands, even though 170 lines is much better than 700
>> lines ;)
>
> I intended to trim it this time but I've hit 'send' before actually
> doing that.. sorry!

No problem :)

>>> We could also depend on cmd_id to accept/reject skbuffs in
>>> ath10k_tm_event_wmi() since, at least for now, there aren't any
>>> special cases to handle. But then.. will we really ever need to have a
>>> passthrough (i.e. pass buffers to userspace but still process them in
>>> the driver afterwards)? Does that even make sense?
>>
>> I think that's getting a bit too complicated. Basically we just need
>> ath10k act as a pipe for WMI packets.
>
> Hmm..
>
> With v1 code if you assume UTF firmware sends an SWBA event then
> ath10k would send the testmode event AND try to actually handle it as
> if it was regular operation.. but how is that supposed to work if you
> have no mac80211 interface structures around at all? My point is
> ath10k_tm_event_wmi() should _consume_ buffers and the caller should
> not processes consumed buffers (assuming you want to keep
> ath10k_tm_event_wmi call where it is now, i.e. before switch-case).

I see your point now, thanks for banging it to my thick head with a
sledge hammer :)

I'll rethink this part and try to solve it for v2. The reason I would
like to avoid your consuming idea is that at some point we might want to
enable this WMI pipe also in "normal mode".

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
