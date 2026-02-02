Return-Path: <ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2AABE7316F
	for <ath10k@archiver.kernel.org>; Mon,  2 Feb 2026 19:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iFTNpwwI8HxXe3bNxl/DR8EwXg3wRD4qBiAli+DfTUo=; b=4Oxnto7baYE3AmAxTIWitU7H6p
	6sdFXp5IKJNPdhMQhEtQWF9pUNXXOZ+eRjDaZ78PZSF8trHYXajW/k90ei276/KM64vEESKlqwN5b
	t4HuRI6c6ln53aFbVcFFO6aTMUVNRtzaMGgt7DxYC+lnHhcVmKgg6f8Nm2VYZRtFpURBRXbi99PFP
	/IgSX8/QUC+EmZdsVc1mK4EqMgnOrorPwSUrsieb5wQD+BGLYboDuWLYLFcCTYhrFWtMHsCaAhaMf
	gqKxafPiu6tEh+HsRl9kocvFhYjPpiuwA9Q8ePQqSlcWYIYMSQQsvc+0MvemofPujSDf0cFBoqTHG
	cjhUeR+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzTJ-00000005VLi-3v4D;
	Mon, 02 Feb 2026 19:20:29 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmzTI-00000005VLN-10t8
	for ath10k@lists.infradead.org;
	Mon, 02 Feb 2026 19:20:29 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 612JJwTU3459166
	for <ath10k@lists.infradead.org>; Mon, 2 Feb 2026 19:20:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iFTNpwwI8HxXe3bNxl/DR8EwXg3wRD4qBiAli+DfTUo=; b=aCUqMb24q/Y2MwzY
	8wyzrbF7kbTyud8+7Txv3rqK+mXviKQBU/YxAFQ1R+PNVP8a1iURTmq+k0Qgc+9p
	Tq4Jv+K/VQehAbAq/pTql0wQd2faln7RqZq+cl+9RoLLA4YrSxdWzFF0hsbZ9TjT
	TaW4/2A84BdAIlsW8VuD2ctimL1OC7LDbQ6Bl21rZUCzH/HWv2qNZdgkD30LZOng
	u67RvmhZK9eWnfQRGTwhqTD4c1lXcegRXszguGWRI9xZCSM8M6Ulap+Zins14GJB
	cmJBf9x6zH/SizbdJEVosM2HabecqgWQrV01GYtTV5/m1LcaigYDQj4A8/RQY5WE
	xTcW8A==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c2trbhgwu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 19:20:27 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b713fa927dso59511eec.0
        for <ath10k@lists.infradead.org>; Mon, 02 Feb 2026 11:20:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770060026; x=1770664826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iFTNpwwI8HxXe3bNxl/DR8EwXg3wRD4qBiAli+DfTUo=;
        b=KIYrZDf7M//nBkWHnknnMyci7ZCylD1ZX8dGsFRxvTFFv4L0bX+nT5MdB2R2jLlVtc
         BdJu7cBFxdq3SJux4NuKpKoINgDcieJzs1MK02SthhM+tI8b1TH+bH16T9DZKY+tlXcU
         hXe9yVt7iGixUHzZrKK+LhZ7BIdwaGrOb+9Y8HoDaZTEKCCo1mjVftGn6nTu6TogPciI
         dpuNCKhGUAbyUw38nEUlYw/R4bLopAFPqApM5cnMpqUosaIOObCIPcRlSetI+tpbgia+
         1KwDsNqyweo0d+aFDZ/An7uVv4TKN7iuPWF97OEFQhGFGlzaX6kyfW4HYXiJ6GLyKsd2
         Z9xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770060026; x=1770664826;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iFTNpwwI8HxXe3bNxl/DR8EwXg3wRD4qBiAli+DfTUo=;
        b=w2IInKos3Tc78STvfHDi75YqGU7Pp/UE8PE0bjIU7kzerAPFimAmTCtYfV6C7/+NKv
         LFYThsuTGf+yc5RNFKYv012ZT/l+rdjKgVJJAYkqX4M6w/8REfxrGbi4Xge114hE6XTL
         gt1h0+mCTe582G2QOfYhppozylpMwo60e78EVE5xxKIXuG+cDhSpsNVrTCXSLtvr45JG
         tT4hxGntvLKl5U4C1QgzB1rE3TgqpdQDJDz8lu6Ored1VcVP69dF4ZcSMgS0Pela/NXA
         HR0vyWUHDEcMBucMm5lKrpziG6AaRnjVKDoG/xN05HEKbes93vStWc4BwXabwU2oy/gs
         csnA==
X-Forwarded-Encrypted: i=1; AJvYcCVhXF9V7OhYVzd6pLvEIv02HZ8B7O+t371TKTPyJhK+gLYWXdQkQJtIlv9yT5O1jNA2bxb0J1M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzePD6O7VL64LzdPASHYD8Q0gHxheEjGY5FM6JkRNj4zpPLqbYL
	+hnrZFejN4qFegPOheza0WlXcNGBhx4394PllDH0ysybrGWBxQAhiyIS+XU0B0j7UIONpGzSYlq
	PQmyvESb6w99waeuMjLDPbmH0GlzcBgvQT9VgcpkMJWaLaS2TBY9fC5rUd263ds06aUbUL93X
X-Gm-Gg: AZuq6aLWCEA/X7XZdbS8xoBwue2jJQH5inmDKg69hAxdeQuuFs3pdJoLWEG03h7Sq/8
	7mnv09RLu10UAyf/is8/uyI99iKU6ibYAEiQq5ynIFrrdBOXQnBW+GF84La3FGhxGgedxQaDklO
	5eqcBm/+tbqUGBITdjh6RV4ov7Yna7yxcmep09NTKnKCIrjZ5lS8MJ2dB7aI0YTyU+EPEbPGXAl
	FBcsYiAGVzflsXHV6uz8/L/zA7F5Ky9UviIDdSq6GV6Hl5JabTwc8q4YJ/iUY/BIf4Z2iu/tDce
	IHXq9i2HspiFjyiQJL8nmrn2E1NxLB1Z1stOu1D8ykaC2r9yIZxtGAdUFrZGLrlYu4dh/uBqscd
	BdGYeh/V10BCO4E0ffiz1lkm1HZ1JTgmAcQdc1MY4zPT7m075WmzSmzeZWvJVYbRkLa0rIS6FTZ
	Qnng==
X-Received: by 2002:a05:7301:6885:b0:2b7:b85e:c37b with SMTP id 5a478bee46e88-2b820f8d3b6mr188503eec.21.1770060025765;
        Mon, 02 Feb 2026 11:20:25 -0800 (PST)
X-Received: by 2002:a05:7301:6885:b0:2b7:b85e:c37b with SMTP id 5a478bee46e88-2b820f8d3b6mr188494eec.21.1770060025126;
        Mon, 02 Feb 2026 11:20:25 -0800 (PST)
Received: from [192.168.1.40] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af88dasm22354194eec.32.2026.02.02.11.20.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Feb 2026 11:20:24 -0800 (PST)
Message-ID: <65c0190b-956a-48e4-bf31-c6ad69d1653a@oss.qualcomm.com>
Date: Mon, 2 Feb 2026 11:20:24 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Fwd: ath10k-firmware: WCN3990 hw1.0: Add Google Pixel 3 XL
To: David Heidelberg <david@ixit.cz>, ath10k@lists.infradead.org
References: <e686e1f0-d3de-4fc4-922a-9100f2962b0d@ixit.cz>
 <7561bd0f-bf2d-4126-9c9f-919616cf9609@ixit.cz>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <7561bd0f-bf2d-4126-9c9f-919616cf9609@ixit.cz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: _DH2ZTD2qA1bpp4jMn-S9vTzvKX4m0ue
X-Authority-Analysis: v=2.4 cv=dcmNHHXe c=1 sm=1 tr=0 ts=6980f8fb cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=qC_FGOx9AAAA:8
 a=kXVcKjEv0dS3lYO96Y8A:9 a=QEXdDO2ut3YA:10 a=dK5gKXOJidcA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-GUID: _DH2ZTD2qA1bpp4jMn-S9vTzvKX4m0ue
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjAyMDE1MSBTYWx0ZWRfXweIJ73LRaxuc
 mR9v6ZX8RKtrENA1+/D6iBoZXEo/qbUJWuDyeP4zHReNKDzIQ4eDqd/OqPu4OuHFu/U6I0tKJge
 nxD7xvi21+hZzeduw2yNfNZmoxj8CKVMWou7p+g/8yKWWO5XX4xka6ZYmJ82pGG4jitiydmAnqt
 slMrgxY64P5/A6byBsBEbuZytFqV7lqfcYROYKaTpjAdBGNDb8DbnBUoMQ0HCGMbIN8uZ9Qk7c8
 4gxDwLoAy02jFTa9DudchsM/aEjVRv1y/17QG6QR52lJvAgRNcFGNdeUT4+xb3VZ4F/QfcsqsnM
 e613EPvhp9JPSn7RRjNgjSAOVvzW9NfIBFhauTxkfGzKlQCXJ6ox5VzXlvFcDApQClIHuaL5hwo
 LP4GK7m9T6dsu0Nf5nbN58p+4Jh7Zyp87vkzkxKVhCWqLmP3yj9kwfI1DZFInSSE9Sqz0xg8Lur
 ykFJqQ+uIntgmODuELw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-02_05,2026-02-02_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0 phishscore=0
 bulkscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602020151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_112028_405495_1977AF27 
X-CRM114-Status: GOOD (  17.15  )
X-BeenThere: ath10k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath10k.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath10k/>
List-Post: <mailto:ath10k@lists.infradead.org>
List-Help: <mailto:ath10k-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/ath10k>,
 <mailto:ath10k-request@lists.infradead.org?subject=subscribe>
Sender: "ath10k" <ath10k-bounces@lists.infradead.org>
Errors-To: ath10k-bounces+ath10k=archiver.kernel.org@lists.infradead.org

On 12/10/2025 11:32 AM, David Heidelberg wrote:
> Hi,
> 
> The support for Pixel 3 XL.
> 
> 
> Now to the questions from the wiki page [1]:
> 
> * description for what hardware this is:
> 
>    - it is a SDM845 based phone
>    - one WCN3990 radio is used as 2.4 / 5 GHz radio
> 
> * origin of the board file (did you create it yourself or where you
>    downloaded)
> 
>    - It's taken from stock firmware image, extracted with pil-squasher 
> by Casey.
> 
> * ids to be used with the board file (ATH10K_BD_IE_BOARD_NAME in ath10k)
> 
>    - WCN3990 hw1.0
> 
>    + bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_crosshatch
>      sha256sum:
>      75b996c08c99f5487f3153668f0b3a19d8fac41727fe93f1dbd900bc80d2a686
>      md5sum:
>      cceb9f7f8dfd4efcc06e2cd27f98e516
> 
> * attach the actual board file (board.bin)
> 
>    - The name of the files are equal to the id string in the board-2.bin
>      (minus the ".bin")
> 
> Kind regards,
>          David
> 
> [1] 
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath10k/boardfiles.html
> 

Thanks, added to WCN3990/hw1.0/board-2.bin:

New:
bus=snoc,qmi-board-id=ff,qmi-chip-id=30214,variant=Google_crosshatch

Changed:

Deleted:

1 board image(s) added, 0 changed, 0 deleted, 32 in total

https://git.codelinaro.org/clo/ath-firmware/ath10k-firmware/-/commit/a04916b512bf0eeaccd008324577f429e7211e4a

