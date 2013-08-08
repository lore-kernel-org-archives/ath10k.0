Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1V7MkY-0005NP-1i
 for ath10k@lists.infradead.org; Thu, 08 Aug 2013 09:43:20 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC 3/3] ath10k: add support for HTT 3.0
References: <1375949298-7159-1-git-send-email-michal.kazior@tieto.com>
 <1375949298-7159-4-git-send-email-michal.kazior@tieto.com>
 <87eha4363n.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnoVmQcMnajTx3vsKwct5PLCNOt6w2qo17fyigm=gO5-w@mail.gmail.com>
 <871u6435c6.fsf@kamboji.qca.qualcomm.com>
 <CA+BoTQnsH6XxpgoBh0tTNCjXvNz-fL6OaCp=LP-Eap_4tqYNkw@mail.gmail.com>
Date: Thu, 8 Aug 2013 12:42:46 +0300
In-Reply-To: <CA+BoTQnsH6XxpgoBh0tTNCjXvNz-fL6OaCp=LP-Eap_4tqYNkw@mail.gmail.com>
 (Michal Kazior's message of "Thu, 8 Aug 2013 11:29:15 +0200")
Message-ID: <87ppto1pt5.fsf@kamboji.qca.qualcomm.com>
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
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org

Michal Kazior <michal.kazior@tieto.com> writes:

> On 8 August 2013 11:22, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Michal Kazior <michal.kazior@tieto.com> writes:
>>
>>> On 8 August 2013 11:05, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>
>>>> This debug print is good to have, but with the new htt version it would
>>>> be good to print it always using the info level. For example, can we add
>>>> it to the same line with "firmware %s booted" string?
>>>
>>> HTT target version is not known when firmware boots up. It's not known
>>> until everything other (HTC, WMI) is set up. We then send a version
>>> request command and we get a response.
>>
>> Oh, missed that.
>>
>>> We need to print it in a separate line.
>>
>> Or could we print the "firmware booted" message later?
>
> I'm worried it may be error-prone in case of firmware loading failure
> in-between (i.e. firmware is booted, but WMI init fails). We'd need to
> print the firmware version in the error path then.

True, let's just print in a separate line. We can worry about compacting
it later.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
