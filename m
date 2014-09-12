Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine02.qualcomm.com ([199.106.114.251])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XSORO-00068E-C6
 for ath10k@lists.infradead.org; Fri, 12 Sep 2014 10:50:58 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: [RFC PATCH 3/3] ath10k: add cal_data debugfs file
References: <20140911202926.12514.79908.stgit@potku.adurom.net>
 <20140911203152.12514.95332.stgit@potku.adurom.net>
 <CA+BoTQkPVN2ivGx0LRkXX2TSVpJLgqjBr9nPhtdntYhWdTpabQ@mail.gmail.com>
Date: Fri, 12 Sep 2014 13:50:30 +0300
In-Reply-To: <CA+BoTQkPVN2ivGx0LRkXX2TSVpJLgqjBr9nPhtdntYhWdTpabQ@mail.gmail.com>
 (Michal Kazior's message of "Fri, 12 Sep 2014 12:11:06 +0200")
Message-ID: <874mwdyux5.fsf@kamboji.qca.qualcomm.com>
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

> On 11 September 2014 22:31, Kalle Valo <kvalo@qca.qualcomm.com> wrote:
>> Provide calibration data used by the firmware to user space via a debugfs file.
>> This makes it easier to debug calibration related problems.
>>
>> Example:
>>
>> sudo cp /sys/kernel/debug/ieee80211/phy0/ath10k/cal_data 1.cal
>
> How about having a generic r/w access to target memory via debugfs?
> Userspace would deal with the extraction of the cal data. 

Yeah, Yanbo is working on that kind of generic interface.

> Or do you want to make it easier for the user to provide the cal data
> without any extra tools (and that sending entire unprocessed target
> memory dump may introduce some privacy concerns)?

This (to make it easier) is exactly my motivation here. In some of the
problems, especially once we add support to get calibration data from
host instead of just OTP, it's important to get easily access to the
calibration data. User only needs to do a simple cp operation and send
the file to us for further investigation.

Of course we could use the generic target memory interface for this, but
it's just more complicated for an unexperienced user and that's why I
think we should have this interface. But to be honest I'm not 100% sure
yet so other comments are more than welcome.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
