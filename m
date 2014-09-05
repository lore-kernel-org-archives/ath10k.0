Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from sabertooth02.qualcomm.com ([65.197.215.38])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPtd5-0006ls-NX
 for ath10k@lists.infradead.org; Fri, 05 Sep 2014 13:32:44 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: WMI version handling
References: <1407261537-11308-1-git-send-email-greearb@candelatech.com>
 <87zjehjkmg.fsf@kamboji.qca.qualcomm.com>
 <54072D19.7010809@candelatech.com>
 <CA+BoTQkbLRpAvmjVEvjCqwTnk9XqFeWOxhr1cpQSuvtVm898tw@mail.gmail.com>
Date: Fri, 5 Sep 2014 16:32:15 +0300
In-Reply-To: <CA+BoTQkbLRpAvmjVEvjCqwTnk9XqFeWOxhr1cpQSuvtVm898tw@mail.gmail.com>
 (Michal Kazior's message of "Thu, 4 Sep 2014 08:56:15 +0200")
Message-ID: <87wq9ifb1c.fsf@kamboji.qca.qualcomm.com>
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
Cc: Ben Greear <greearb@candelatech.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

Michal Kazior <michal.kazior@tieto.com> writes:

> On 3 September 2014 17:00, Ben Greear <greearb@candelatech.com> wrote:
>> On 09/02/2014 11:14 PM, Kalle Valo wrote:
>>> Hi,
> [...]
>>> Also I have been thinking that using firmware feature bits (for example
>>> ATH10K_FW_FEATURE_WMI_10_2 and ATH10K_FW_FEATURE_WMI_10X) for WMI
>>> version is not the best way. I think it's easier to manage all this if
>>> we have a u32 FW IE to provide WMI version. IIRC Ben was suggesting this
>>> at some point.
>>>
>>> Example:
>>>
>>> enum ath10k_fw_wmi_version {
>>>       ATH10K_FW_WMI_VERSION_MAIN = 0,
>>>       ATH10K_FW_WMI_VERSION_10_1 = 1,
>>>       ATH10K_FW_WMI_VERSION_10_2 = 2,
>>> }
>>>
>>> And then wmi.c would set correct interface based on this version.
>>
>> I am happy with the current flags, it seems to work well enough.
>
> I'm actually okay with this but I'd actually throw out the "wmi"
> string from it and leave out just "ath10k_fw_version". I've recently
> discovered some minor HTT discrepancies between fw branches so we
> might want to use the version tag to pick HTT "backend" as well..

I'm again thinking that we should have a separate enum for the HTT
version. So that the firmware interface is defined with WMI version, HTT
version and feature flags (which define smaller changes in the
interface).

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
