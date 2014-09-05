Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from wolverine01.qualcomm.com ([199.106.114.254])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XPtUF-00035L-Pt
 for ath10k@lists.infradead.org; Fri, 05 Sep 2014 13:23:37 +0000
From: Kalle Valo <kvalo@qca.qualcomm.com>
Subject: Re: WMI version handling
References: <1407261537-11308-1-git-send-email-greearb@candelatech.com>
 <87zjehjkmg.fsf@kamboji.qca.qualcomm.com>
 <54072D19.7010809@candelatech.com>
Date: Fri, 5 Sep 2014 16:23:08 +0300
In-Reply-To: <54072D19.7010809@candelatech.com> (Ben Greear's message of "Wed, 
 3 Sep 2014 08:00:41 -0700")
Message-ID: <871trqgq0z.fsf@kamboji.qca.qualcomm.com>
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
To: Ben Greear <greearb@candelatech.com>
Cc: ath10k@lists.infradead.org

Ben Greear <greearb@candelatech.com> writes:

>> Also I have been thinking that using firmware feature bits (for example
>> ATH10K_FW_FEATURE_WMI_10_2 and ATH10K_FW_FEATURE_WMI_10X) for WMI
>> version is not the best way. I think it's easier to manage all this if
>> we have a u32 FW IE to provide WMI version. IIRC Ben was suggesting this
>> at some point.
>> 
>> Example:
>> 
>> enum ath10k_fw_wmi_version {
>> 	ATH10K_FW_WMI_VERSION_MAIN = 0,
>> 	ATH10K_FW_WMI_VERSION_10_1 = 1,
>> 	ATH10K_FW_WMI_VERSION_10_2 = 2,
>> }
>> 
>> And then wmi.c would set correct interface based on this version.
>
> I am happy with the current flags, it seems to work well enough.

Yeah, there's no problem at the moment. But if we start adding more
interfaces handling them through feature flags will become more
difficult. That's why I think adding a separate enum will be better in
the long run.

> I'd leave policy out of the IEs as much as possible, as normal users
> cannot modify it, and certainly it would be a problem if you wanted
> different policy with different NICs in same system. IEs should
> describe the minimum needed for the ath10k to enforce policy as best
> as it can.

The firmware IEs are not about policy. They are about advertising the
capabilities of the firmware image so that ath10k can know how to
configure the firmare.

> We have to assume that users tweaking station and peer count can deal
> with fw crashes until they get the settings right.

No way. In no circumstances ath10k should configure firmware out of
bounds. If we do that, it's a bug in ath10k.

-- 
Kalle Valo

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
