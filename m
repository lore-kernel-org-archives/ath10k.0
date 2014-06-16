Return-path: <ath10k-bounces+kvalo=adurom.com@lists.infradead.org>
Received: from mail2.candelatech.com ([208.74.158.173])
 by bombadil.infradead.org with esmtp (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WwYCj-0007Aa-Ut
 for ath10k@lists.infradead.org; Mon, 16 Jun 2014 14:48:14 +0000
Message-ID: <539F0393.1090009@candelatech.com>
Date: Mon, 16 Jun 2014 07:47:47 -0700
From: Ben Greear <greearb@candelatech.com>
MIME-Version: 1.0
Subject: Re: RE : ath10k: firmware crash in station mode & problem DFS
References: <1399565896-29791-1-git-send-email-greearb@candelatech.com>
 <538E9D26.4040009@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FB@srvexch01.SODIELEC .local>,
 <538F9255.1060101@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F109978FF@srvexch01.SODIELEC.local>,
 <5390A9CC.7060400@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997900@srvexch01.SODIELEC.local>,
 <5391E363.50907@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997902@srvexch01.SODIELEC.local>,
 <53972984.8020303@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997906@srvexch01.SODIELEC.local>,
 <53988C53.6030806@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F10997908@srvexch01.SODIELEC.local>,
 <539A0C06.6050105@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790A@srvexch01.SODIELEC.local>,
 <539B2F21.3020609@candelatech.com>
 <EE97821C81277E459BEA5C6384C6F241012F1099790B@srvexch01.SODIELEC.local>
In-Reply-To: <EE97821C81277E459BEA5C6384C6F241012F1099790B@srvexch01.SODIELEC.local>
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+kvalo=adurom.com@lists.infradead.org
To: Vu Hai NGUYEN <vh.nguyen@actiasodielec.fr>
Cc: Janusz Dziedzic <janusz.dziedzic@tieto.com>, Patrick CARNEIRO RODRIGUEZ <p.carneiro@actiasodielec.fr>, "ath10k@lists.infradead.org" <ath10k@lists.infradead.org>, Janusz Dziedzic <janusz.dziedzic@gmail.com>



On 06/16/2014 12:16 AM, Vu Hai NGUYEN wrote:
>> Also, do you see this same behaviour on non-DFS channels?
>
> No your firmware works normally on non-DFS channels.
>
>> Looks like my scan-on-operating-channel optimization patch is
>> the problem.  I have just disabled this until I have time to
>> debug it in detail...
>>
>> Here is a build of my full patch-set with that buggy patch reverted,
>> please see if it works for you:
>>
>> http://www.candelatech.com/downloads/firmware-2-community-scanfix.bin
>
> Thanks,  I just do the test with your new firmware, It works on DFS channels and promiscuous mode.
> If you update something for your patch, please feel free to ask me to do the test.

I uploaded the latest CT firmware builds with this fix last Friday.  The 10.1.467-ct-006
should be basically the same as the -scanfix.bin that you tested earlier.

Please let me know if you see any additional problems.

Thanks,
Ben


-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com

_______________________________________________
ath10k mailing list
ath10k@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/ath10k
