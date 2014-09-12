Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSTYD-0000tW-R1
 for ath10k@lists.infradead.org; Fri, 12 Sep 2014 16:18:22 +0000
Message-ID: <54131CB3.3070104@candelatech.com>
Date: Fri, 12 Sep 2014 09:17:55 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH 3/3] ath10k: add cal_data debugfs file
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
 <20140911203152.12514.95332.stgit@potku.adurom.net>
 <CA+BoTQkPVN2ivGx0LRkXX2TSVpJLgqjBr9nPhtdntYhWdTpabQ@mail.gmail.com>
 <874mwdyux5.fsf@kamboji.qca.qualcomm.com>
In-Reply-To: <874mwdyux5.fsf@kamboji.qca.qualcomm.com>
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
Cc: Michal Kazior <michal.kazior@tieto.com>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>

On 09/12/2014 03:50 AM, Kalle Valo wrote:
> Michal Kazior <michal.kazior@tieto.com> writes:
> 
>> On 11 September 2014 22:31, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>>> Provide calibration data used by the firmware to user space via a debugfs file.
>>> This makes it easier to debug calibration related problems.
>>>
>>> Example:
>>>
>>> sudo cp /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data 1.cal
>>
>> How about having a generic r/w access to target memory via debugfs?
>> Userspace would deal with the extraction of the cal data. 
> 
> Yeah, Yanbo is working on that kind of generic interface.
> 
>> Or do you want to make it easier for the user to provide the cal data
>> without any extra tools (and that sending entire unprocessed target
>> memory dump may introduce some privacy concerns)?
> 
> This (to make it easier) is exactly my motivation here. In some of the
> problems, especially once we add support to get calibration data from
> host instead of just OTP, it's important to get easily access to the
> calibration data. User only needs to do a simple cp operation and send
> the file to us for further investigation.
> 
> Of course we could use the generic target memory interface for this, but
> it's just more complicated for an unexperienced user and that's why I
> think we should have this interface. But to be honest I'm not 100% sure
> yet so other comments are more than welcome.

Different firmware may place this at different locations, so I definitely
like a well-defined interface to grab the requested data instead of having to
try to grab it out of a full ram dump.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
