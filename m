Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Y1UBM-00050A-R6
 for ath10k@lists.infradead.org; Thu, 18 Dec 2014 06:03:29 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [PATCH 2/2] ath10k: send (re)assoc peer command when NSS changed
References: <1418719980-19753-1-git-send-email-janusz.dziedzic@tieto.com>
 <1418719980-19753-2-git-send-email-janusz.dziedzic@tieto.com>
 <87a92mr2gi.fsf@kamboji.qca.qualcomm.com>
 <CALhHN=rvAPMPOWyOM207sAiS+YQ2fWKEM0BO6d1KM7a+F6e3zQ@mail.gmail.com>
Date: Thu, 18 Dec 2014 08:02:59 +0200
In-Reply-To: <CALhHN=rvAPMPOWyOM207sAiS+YQ2fWKEM0BO6d1KM7a+F6e3zQ@mail.gmail.com>
 (Janusz Dziedzic's message of "Thu, 18 Dec 2014 06:28:22 +0100")
Message-ID: <87388dpka4.fsf@kamboji.qca.qualcomm.com>
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
To: Janusz Dziedzic <janusz.dziedzic@tieto.com>
Cc: linux-wireless@vger.kernel.org, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:

> On 17 December 2014 at 11:32, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Janusz Dziedzic <janusz.dziedzic@tieto.com> writes:
>>
>>> Assoc peer command contain information about NSS.
>>> When we will get IEEE80211_RC_NSS_CHANGED we should
>>> also send (re) assoc peer command to be sure firmware
>>> will know about it and RC will work correctly.
>>>
>>> Signed-off-by: Janusz Dziedzic <janusz.dziedzic@tieto.com>
>>
>> Does this fix a user visible bug or is this something you just found
>> from doing code review?
>
> In case we will get only IEEE80211_RC_NSS_CHANGED we will not update
> FW configuration correctly. This is not the problem when IBSS, while
> we update two flags in one step IEEE80211_RC_SUPP_RATES_CHANGED |
> IEEE80211_RC_NSS_CHANGED.
>
> We could have problems when mac80211 will send only NSS_CHANGED flag.
> This seems could happen when we will get WLAN_EID_OPMODE_NOTIF. I
> didn't test such case, but I believe some AP could send such
> notification. So, this fix potential TP issue.

Ok, I'll add to the commit log that this was found during code review
(and doesn't fix a reported bug).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
